import { LightningElement, wire } from 'lwc';
import getContactList from '@salesforce/apex/refreshContactController.getContactList'
import { updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'
import {refreshApex} from '@salesforce/apex'

const columns = [
    { label: 'First Name', fieldName: 'FirstName', editable: true },
    { label: 'Last Name', fieldName: 'LasttName', editable: true },
    { label: 'Email', fieldName: 'Email', type: 'email' }
]

export default class RefreshDemoLwc extends LightningElement {
    columns = columns
    draftValues = []


    @wire(getContactList)
    contact;

    handleSave(event) {
        console.log(event.detail.draftValues)
        const recordInputs = event.detail.draftValues.slice().map(draft => {
            const fields = Object.assign({}, draft)
            return { fields }
        })
        console.log("recordInputs", recordInputs)

        const promises = recordInputs.map(recordInput => updateRecord(recordInput))
        Promise.all(promises).then(result => {
            this.ShowToastMsg('success','contacts updated')
            this.draftValues=[]
            return refreshApex(this.contact)
        }).catch(error => {
            this.ShowToastMsg('error creating record',error.body.message,error)

        })
    }


    ShowToastMsg(title, message, variant) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: title,
                message: message,
                variant: variant || 'success'
            })
        )
    }
}