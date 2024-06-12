import { LightningElement, wire, api } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
// import Name_Field from '@salesforce/schema/Account.Name';
// import Phone_Field from '@salesforce/schema/Account.Phone';


export default class WireadaptorDemo extends LightningElement {

    @api recordId;
    @wire(getRecord, { recordId: '$recordId', fields: ['Account.Name','Account.Phone'] })
    record;

    get name() {
        return this.record.data ? getFieldValue(this.record.data, 'Account.Name') : '';
    }

    get phone() {
        return this.record.data ? getFieldValue(this.record.data, 'Account.Phone') : '';
    }
}