import { LightningElement } from 'lwc';

export default class Quizapp extends LightningElement {

    // for storing answer
    selected = {

    }

    // to show the number of correct answer
    correctanswer = 0

    // used to show the result
    issubmitted = false;

    myquestion = [
        {
            id: 'question1',
            question: "which one of the following is not a template loop ?",
            answers: {
                a: "for:each",
                b: "iterator",
                c: 'map loop'
            },
            correctanswer: "a"
        },

        {
            id: 'question2',
            question: "which one of the following is not a template loop ?",
            answers: {
                a: "for:each",
                b: "iterator",
                c: 'map loop'
            },
            correctanswer: "b"
        },

        {
            id: 'question3',
            question: "which one of the following is not a template loop ?",
            answers: {
                a: "for:each",
                b: "iterator",
                c: 'map loop'
            },
            correctanswer: "c"
        }       
    ]

    // changehandler gets called on every click on the option
    changehandler(event) {
        // console.log("name", event.target.name);
        // console.log("value", event.target.value);

        const name = event.target.name;
        const value = event.target.value;

        this.selected = { ...this.selected, [name]: value };
    }

    // form submit handler
    submithandler(event) {
        event.preventDefault();
        let correct = this.myquestion.filter(item => this.selected[item.id] === item.correctanswer);
        this.correctanswer = correct.length;
        this.issubmitted = true;
        // console.log("correct answer",this.correctanswer);
    }

    // form reset handler
    resethandler() {
        this.selected = {};
        this.correctanswer = 0;
        this.issubmitted = false;
    }

    // used for disabling the submit button
    get allnotselected() {
        return !(Object.keys(this.selected).length === this.myquestion.length);
    }

    // for appling dynamic style to our result
    get isscoredfull() {
        return `slds-text-heading_large ${this.myquestion.length === this.correctanswer ? 'slds-text-color_success' : 'slds-text-color_error'}`
    }
}