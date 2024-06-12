import { LightningElement, wire } from 'lwc';
import getParentChildPetRecords from '@salesforce/apex/ParentChildController.getParentChildPetRecords';

export default class ParentChildComponent extends LightningElement {
    parentChildPetData = [];
    error;

    // Columns for datatable
    columns = [
        { label: 'Parent Name', fieldName: 'parentName' },
        { label: 'Child Names', fieldName: 'childNames' },
        { label: 'Pet Names', fieldName: 'petNames' }
    ];

    @wire(getParentChildPetRecords)
    wiredParentChildPetRecords({ error, data }) {
        if (data) {
            this.parentChildPetData = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.parentChildPetData = undefined;
        }
    }
}