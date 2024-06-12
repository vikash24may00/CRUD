import { LightningElement, wire } from 'lwc';
import Id from '@salesforce/user/Id';
import { getRecord } from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/User.Name';
import EMAIL_FIELD from '@salesforce/schema/User.Email';
const fields = [NAME_FIELD, EMAIL_FIELD];

export default class WireDemo extends LightningElement {
    userId = Id;

    userDetail
    @wire(getRecord, { recordId:'$userId', fields })
    userDetailHandler({ data, error }) {
        if (data) {
            this.userDetail = data.fields
        }
        if (error) {
            console.log(error)
        }
    }


    @wire(getRecord, { recordId: '$userId', fields })
    userDetailProperty
}