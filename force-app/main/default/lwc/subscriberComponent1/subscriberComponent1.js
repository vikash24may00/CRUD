import { LightningElement, track } from 'lwc';
import { subscribe, unsubscribe } from 'c/pubsub';

export default class SubscriberComponent1 extends LightningElement {
    @track message = '';

    connectedCallback() {
        subscribe('simpleEvent', this.handleEvent.bind(this));
    }

    handleEvent(payload) {
        this.message = payload.message;
    }

    disconnectedCallback() {
        unsubscribe('simpleEvent', this.handleEvent.bind(this));
    }
}