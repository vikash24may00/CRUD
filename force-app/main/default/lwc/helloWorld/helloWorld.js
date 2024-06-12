import { LightningElement, track } from 'lwc';

export default class HelloWorld extends LightningElement {

    // two way data binding
    name = "vikash";
    title = "munda";

    changehandler(event) {
        this.title = event.target.value;
    }


    // @track
    @track address = {
        city : 'jamshedpur',
        pincode : 201,
        country : 'india'
    }

    trackhandler(event) {
        this.address.city = event.target.value;
    }


    // getter method
    user = ['vikash','akash','ravi'];
    num1=2;
    num2=3;

    get name()
    {
        return this.user[0];
    }

    get multiply()
    {
        return this.num1*this.num2;
    }
}