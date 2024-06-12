import { LightningElement } from 'lwc';

export default class ConditionalRendering extends LightningElement {
    isvisible = false;
    name;

    handleclick() {
        this.isvisible = true;
    }

    changehandler(event)
    {
        this.name = event.target.value;
    }

    get hellomethod()
    {
        return this.name === 'hello';
    }
}