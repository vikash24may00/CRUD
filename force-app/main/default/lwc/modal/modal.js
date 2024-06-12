import { LightningElement, api } from 'lwc';

export default class Modal extends LightningElement {
    @api modalTitle;
    @api submitButtonLabel;

    handleClose() {
        this.dispatchEvent(new CustomEvent('close'));
    }

    handleSubmit() {
        this.dispatchEvent(new CustomEvent('submit'));
    }
}