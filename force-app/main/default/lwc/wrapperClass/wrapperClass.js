import { LightningElement, track, wire } from 'lwc';
import getOpportunities from '@salesforce/apex/OpportunityController.getOpportunities';

export default class OpportunityDataTable extends LightningElement {
     opportunityData = [];
     error;

    columns = [
        { label: 'Opportunity Name', fieldName: 'opportunityName', type: 'text' },
        { label: 'Account Name', fieldName: 'accountName', type: 'text' },
        { label: 'Contact Name', fieldName: 'contactName', type: 'text' }
    ];

    // Fetch opportunities using wire service
    @wire(getOpportunities)
    wiredOpportunities({ error, data }) {
        if (data) {
            this.opportunityData = data;
            this.error = undefined;
        } else if (error) {
            this.opportunityData = undefined;
            this.error = error;
        }
    }
}