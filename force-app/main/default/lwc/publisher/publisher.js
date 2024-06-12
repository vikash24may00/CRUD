import { LightningElement } from 'lwc';
import { createMessageContext, publish } from 'lightning/messageService';
import DEMO_MESSAGE_CHANNEL from '@salesforce/messageChannel/DemoMessageChannel__c';

export default class Publisher extends LightningElement {
    message = '';
    context = createMessageContext();

    handleChange(event) {
        this.message = event.target.value;
    }

    handleClick() {
        const message = { text: this.message };
        publish(this.context, DEMO_MESSAGE_CHANNEL, message);
    }
}