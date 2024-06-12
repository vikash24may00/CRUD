import { LightningElement } from 'lwc';
import { deleteRecord } from 'lightning/uiRecordApi';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'

export default class DeleteRecordDemo extends LightningElement {
    recordId

    changeHandler(event) {
        this.recordId = event.target.value
    }

    deleteHandler() {
        deleteRecord(this.recordId).then(() => {
            this.ShowToast("Sucess!!",'Deleted successfully','success')
        }).catch(error => {
            console.log(error)
            this.ShowToast("Error!!",'Error Occured','error')
        })
    }

    ShowToast(title,message,variant)
    {
        this.dispatchEvent(new ShowToastEvent({
            title,
            message,
            variant
        }))
    }
}