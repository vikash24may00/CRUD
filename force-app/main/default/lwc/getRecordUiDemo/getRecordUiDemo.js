import { LightningElement, wire, api } from 'lwc';
import { getRecordUi } from 'lightning/uiRecordApi';

export default class GetRecordUiDemo extends LightningElement {

    formFields = [
        { fielName: "AccountNumber", "label": "Account Number" },
        { fielName: "AnnualRevenue", "label": "Annual Revenue" },
        { fielName: "Name", "label": "Name" },
        { fielName: "Phone", "label": "Phone" },


    ]

    @api recordId
    @wire(getRecordUi, { recordIds: '$recordId', layoutTypes: 'Full', modes: 'Edit' })
    accountRecordUiHandler({ data, error }) {
        if (data) {
            console.log(data)
            this.formFields = this.formFields.map(item => {
                return { ...item, value: data.records[this.recordId].fields[item.fielName].value }
            })
        }
        if (error) {
            console.log(error)
        }
    }

}