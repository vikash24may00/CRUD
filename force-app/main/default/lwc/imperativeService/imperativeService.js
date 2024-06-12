import { LightningElement, track } from 'lwc';
import getAccounts from '@salesforce/apex/WireAsPropertyAccountController.getAccounts';

export default class AccountSearch extends LightningElement {
    //  searchKey = '';  // The search key entered by the user
     accounts;        // List of accounts matching the search key
     error;           // Error message if there is an error

    // Handle input change in the search field
    handleInputChange(event) {
        // Update the search key
        // this.searchKey = event.target.value;
        const frontsearchKey = event.target.value;

        // Call the Apex method imperatively with searchKey parameter 
        // getAccounts({ searchKey: this.searchKey })
        getAccounts({ searchKey: frontsearchKey })
            .then(result => {
                // If data is returned, set the accounts and clear any error
                this.accounts = result;
                this.error = undefined;
            })
            .catch(error => {
                // If there is an error, set the error message and clear accounts
                this.error = error;
                this.accounts = undefined;
            });
    }
}

// use when we need to call apex with event directly