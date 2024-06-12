import { LightningElement, api } from 'lwc';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import ANNUAL_REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import TYPE_FILED from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ACTIVE_FIELD from '@salesforce/schema/Account.Active__c';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class RecordFormDemo extends LightningElement {

    @api recordId;
    @api objectApiName;
    
    objectname = ACCOUNT_OBJECT;
    fieldlist = [NAME_FIELD, ANNUAL_REVENUE_FIELD, TYPE_FILED, INDUSTRY_FIELD, ACTIVE_FIELD];

    successHandler(event) {
        console.log(event.detail.id);
        const toastEvent = new ShowToastEvent({
            title: "Account Created",
            message: "Record ID:" + event.detail.id,
            variant: "Success"
        })
        this.dispatchEvent(toastEvent);
    }
}