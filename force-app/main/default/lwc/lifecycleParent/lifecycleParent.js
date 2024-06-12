import { LightningElement } from 'lwc';

export default class LifecycleParent extends LightningElement 
{
    constructor()
    {
        super()
        console.log('parent constructor called');
    }

    connectedCallback()
    {
        console.log('parent connectedcallback called');
    }

    renderedCallback()
    {
        console.log('parent renderedCallback called');
    }
}