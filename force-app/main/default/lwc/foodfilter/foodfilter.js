// import { LightningElement, wire } from 'lwc';

// export default class foodFilter extends LightningElement {

//     filters = {
//         searchKey: '',
//     }

//     handleSearchKeyChange(event) {
//         console.log(event.target.value);
//         this.filters = { ...this.filters, "searchKey": event.target.value }
//     }
 
// }

import { LightningElement, track } from 'lwc';
// import searchResults from '@salesforce/apex/SearchController.search';

export default class SearchComponent extends LightningElement {
    @track searchTerm = '';

    handleChange(event) {
        console.log(event.target.value);
        this.searchTerm = event.target.value;
    }

    // search() {
    //     searchResults({ searchTerm: this.searchTerm })
    //         .then(result => {
    //             console.log('mila')
    //         })
    //         .catch(error => {
    //             console.error(error);
    //         });
    // }
}