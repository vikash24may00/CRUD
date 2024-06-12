import { LightningElement } from 'lwc';
import { publish } from 'c/pubsub';

export default class PublisherComponent extends LightningElement {
    handlePublish() {
        publish('simpleEvent', { message: 'Hello from Publisher!' });
    }
}