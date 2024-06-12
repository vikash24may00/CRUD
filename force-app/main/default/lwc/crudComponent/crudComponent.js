import { LightningElement, track } from 'lwc';
import saveRecords from '@salesforce/apex/CRUD.saveRecords';

export default class ContactCrud extends LightningElement {
    @track accountName;
    @track email;
    @track phone;
    @track isLoading = false;
    @track recordId;

    handleChange(event) {
        const fieldName = event.target.name;
        const value = event.target.value;
        this[fieldName] = value;
    }

    handleSave() {
        this.isLoading = true;
    
        saveRecords({
            accountName: this.accountName,
            email: this.email,
            phone: this.phone,
            recordId: this.recordId
        })
        .then(result => {
            this.recordId = result;
            console.log('Record saved successfully with ID:', result);
            this.resetForm();
        })
        .catch(error => {
            console.error('Error saving record:', error);
            console.error('Error details:', JSON.stringify(error));
        })
        .finally(() => {
            this.isLoading = false;
        });
    }

    resetForm() {
        this.accountName = '';
        this.email = '';
        this.phone = '';
        this.recordId = undefined;
    }
}