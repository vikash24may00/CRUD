// import { LightningElement, wire } from 'lwc';
// import getAccountContacts from '@salesforce/apex/AccountContactController.getAccountContacts';

// export default class WrapperClassDemo extends LightningElement {
//     accountContacts;
//     error;

//     columns = [
//         { label: 'Account Name', fieldName: 'accountName', type: 'text' },
//         { label: 'Contact Name', fieldName: 'contactName', type: 'text' }
//     ];

//     @wire(getAccountContacts)
//     wiredAccountContacts({ error, data }) {
//         if (data) {
//             this.accountContacts = data.map(wrapper => ({
//                 id: wrapper.account.Id,
//                 accountName: wrapper.account.Name,
//                 contactName: wrapper.contact ? wrapper.contact.Name : 'N/A'
//             }));
//             this.error = undefined;
//         } else if (error) {
//             this.error = error;
//             this.accountContacts = undefined;
//         }
//     }
// }


import { LightningElement, wire } from 'lwc';
import getAccountContacts from '@salesforce/apex/AccountContactController.getAccountContacts';

export default class AccountContactComponent extends LightningElement {
    accountContactData = [];
    error;

    // Columns for datatable
    columns = [
        { label: 'Account Name', fieldName: 'accountName' },
        { label: 'Contact Names', fieldName: 'contactNames' }
    ];

    @wire(getAccountContacts)
    wiredAccountContacts({ error, data }) {
        if (data) {
            // Ensure data is properly structured
            this.accountContactData = data.map(record => ({
                id: record.accountName, // Use account name or another unique field as key
                ...record
            }));
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.accountContactData = undefined;
        }
    }
}