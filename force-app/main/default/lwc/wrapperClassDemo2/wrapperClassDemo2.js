import { LightningElement, wire } from 'lwc';
import getCustomData from '@salesforce/apex/CustomDataController.getCustomData';

export default class CustomDataWrapper extends LightningElement {
    data;
    error;

    columns = [
        { label: 'Name', fieldName: 'name' },
        { label: 'Age', fieldName: 'age', type: 'number' }
    ];

    @wire(getCustomData)
    wiredCustomData({ error, data }) {
        if (data) {
            this.data = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.data = undefined;
        }
    }
}