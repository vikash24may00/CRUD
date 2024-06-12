import { LightningElement } from 'lwc';

export default class LifecycleChild extends LightningElement 
{
    constructor()
    {
        super()
        console.log('child constructor called');
    }

    connectedCallback()
    {
        console.log('child connectedcallback called');
    }

    renderedCallback()
    {
        console.log('child renderedCallback called');
    }
}