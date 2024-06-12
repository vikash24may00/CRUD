import { LightningElement, track } from 'lwc';
import { createMessageContext, subscribe } from 'lightning/messageService';
import DEMO_MESSAGE_CHANNEL from '@salesforce/messageChannel/DemoMessageChannel__c';

export default class Subscriber extends LightningElement {
    @track receivedMessage = '';
    context = createMessageContext();

    connectedCallback() {
        subscribe(this.context, DEMO_MESSAGE_CHANNEL, (message) => {
            this.receivedMessage = message ? message.text : 'No message received';
        });
    }
}