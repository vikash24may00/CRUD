import { LightningElement, track } from 'lwc';
import searchFlights from '@salesforce/apex/FlightSearch.searchFlights';

export default class ParentComponent extends LightningElement {
    @track flightResults;

    handleFlightSearch(event) {
        const searchCriteria = event.detail;
        searchFlights({ 
            departure: searchCriteria.departure,
            destination: searchCriteria.destination,
            startDate: searchCriteria.startDate,
            endDate: searchCriteria.endDate,
            passengers: searchCriteria.passengers 
        })
        .then(result => {
            this.flightResults = result;
        })
        .catch(error => {
            console.error('Error searching flights:', error);
        });
    }
}