import { LightningElement, wire } from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import PROPERTY_MESSAGE_CHANNEL from '@salesforce/messageChannel/PropertyMessageChannel__c';
import searchPropertyItems from '@salesforce/apex/PropertyController.searchPropertyItems';
import deleteProperty from '@salesforce/apex/PropertyController.deleteProperty';
import { loadScript } from 'lightning/platformResourceLoader';
import CHARTJS from '@salesforce/resourceUrl/chartjs';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class PropertyPublisher extends LightningElement {
    searchTerm = '';
    selectedFilters = {
        Small: false,
        Medium: false,
        Large: false
    };
    priceRange = 0;
    maxPrice = 99999;
     propertyItems;
    chart;
    chartjsInitialized = false;
    error;
    showModal = false;
    currentPropertyId;
    modalTitle = 'Add Property';
    submitButtonLabel = 'Save';

    @wire(MessageContext)
    messageContext;

    connectedCallback() {
        if (!this.chartjsInitialized) {
            this.chartjsInitialized = true;
            loadScript(this, CHARTJS)
                .then(() => {
                    this.generatePropertyTypeChart();
                })
                .catch(error => {
                    this.error = error;
                });
        }
        this.search();
    }

    handleInputChange(event) {
        this.searchTerm = event.target.value;
        if (this.searchTerm.length >= 3 || this.searchTerm.length === 0) {
            this.search();
        }
    }

    handleFilterChange(event) {
        const filter = event.target.value;
        this.selectedFilters[filter] = event.target.checked;
        this.search();
    }

    clearFilter() {
        this.searchTerm = '';
        this.selectedFilters = { Small: false, Medium: false, Large: false };
        this.priceRange = this.maxPrice;
        this.search();
    }

    handleSearch() {
        this.search();
    }

    handlePriceChange(event) {
        this.priceRange = event.target.value;
        this.search();
    }

    handleAddProperty() {
        this.modalTitle = 'Add Property';
        this.submitButtonLabel = 'Save';
        this.currentPropertyId = null;
        this.showModal = true;
    }

    handleEditProperty(event) {
        const propertyId = event.detail;
        const property = this.propertyItems.find(prop => prop.Id === propertyId);
        if (property) {
            this.modalTitle = 'Edit Property';
            this.submitButtonLabel = 'Update';
            this.currentPropertyId = property.Id;
            this.showModal = true;
        }
    }

    handleDeleteProperty(event) {
        const propertyId = event.detail;
        deleteProperty({ propertyId })
            .then(() => {
                this.showToast('Success', 'Property deleted successfully', 'success');
                this.search();
            })
            .catch(error => {
                this.showToast('Error', 'Error deleting property', 'error');
            });
    }

    handleModalClose() {
        this.showModal = false;
    }


    handleSuccess(event) {
        this.showModal = false;
        this.showToast('Success', 'Property saved successfully', 'success');
        const newPropertyId = event.detail.id; // Get the newly added property's ID from the event detail
        // this.search(); // Refresh the property list to include the new property
        // Retrieve the updated list of properties including the newly added property
    this.search().then(() => {
        // Publish the updated property list to the message channel
        this.publishProperties();
    });
    }

    // publishProperties(properties) {
    //     const message = {
    //         properties: properties
    //     };
    //     publish(this.messageContext, PROPERTY_MESSAGE_CHANNEL, message);
    // }

    publishProperties() {
        const message = {
            properties: this.propertyItems
        };
        publish(this.messageContext, PROPERTY_MESSAGE_CHANNEL, message);
    }

   
    
    handleError() {
        this.showToast('Error', 'Error saving property', 'error');
    }

    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title,
            message,
            variant,
        });
        this.dispatchEvent(event);
    }

  

    // search() {
    //     const filters = Object.keys(this.selectedFilters).filter(key => this.selectedFilters[key]);
    //     searchPropertyItems({ searchKeywords: this.searchTerm, filters: filters, priceRange: this.priceRange })
    //         .then(result => {
    //             this.propertyItems = result;
    //             this.error = undefined;
    //             this.updatePropertyTypeChart();
    //             this.publishProperties();
    //         })
    //         .catch(error => {
    //             this.error = error;
    //             this.propertyItems = undefined;
    //         });
    // }

    search() {
        const filters = Object.keys(this.selectedFilters).filter(key => this.selectedFilters[key]);
        return searchPropertyItems({ searchKeywords: this.searchTerm, filters: filters, priceRange: this.priceRange })
            .then(result => {
                this.propertyItems = result;
                this.error = undefined;
                this.updatePropertyTypeChart();
                this.publishProperties(result); // Publish properties after fetching

            })
            .catch(error => {
                this.error = error;
                this.propertyItems = undefined;
            });
    }

    generatePropertyTypeChart() {
        let propertyTypeCounts = {
            Small: 0,
            Medium: 0,
            Large: 0
        };

        if (this.propertyItems) {
            this.propertyItems.forEach(property => {
                propertyTypeCounts[property.PropertyType__c]++;
            });
        }

        if (this.chart) {
            this.chart.destroy();
        }

        const ctx = this.template.querySelector('canvas').getContext('2d');
        this.chart = new window.Chart(ctx, {
            type: 'bar',
            data: {
                labels: Object.keys(propertyTypeCounts),
                datasets: [{
                    label: 'Property Type',
                    data: Object.values(propertyTypeCounts),
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true,
                            precision: 0
                        }
                    }]
                }
            }
        });
    }

    updatePropertyTypeChart() {
        let propertyTypeCounts = {
            Small: 0,
            Medium: 0,
            Large: 0
        };

        if (this.propertyItems) {
            this.propertyItems.forEach(property => {
                propertyTypeCounts[property.PropertyType__c]++;
            });
        }

        this.chart.data.labels = Object.keys(propertyTypeCounts);
        this.chart.data.datasets[0].data = Object.values(propertyTypeCounts);
        this.chart.update();
    }

    publishProperties() {
        const message = {
            properties: this.propertyItems
        };
        publish(this.messageContext, PROPERTY_MESSAGE_CHANNEL, message);
    }

    
}