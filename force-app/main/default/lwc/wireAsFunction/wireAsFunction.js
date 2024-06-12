import { LightningElement, track, wire } from 'lwc';
import getAccounts from '@salesforce/apex/WireAsPropertyAccountController.getAccounts';

export default class AccountSearch extends LightningElement {
     frontsearchKey = '';  // The search key entered by the user
     accounts;        // List of accounts matching the search key
     error;           // Error message if there is an error

    // Wire adapter to call Apex method based on the search key
    @wire(getAccounts, { searchKey: '$frontsearchKey' })
    wiredAccounts({ error, data }) {
        if (data) {
            // If data is returned, set the accounts and clear any error
            this.accounts = data;
            this.error = undefined;
        } else if (error) {
            // If there is an error, set the error message and clear accounts
            this.accounts = undefined;
            this.error = error;
        }
    }

    // Handle input change in the search field
    handleInputChange(event) {
        // Update the search key, which triggers the wire adapter to fetch data
        this.frontsearchKey = event.target.value;
    }
}

// use when we need to modify the data