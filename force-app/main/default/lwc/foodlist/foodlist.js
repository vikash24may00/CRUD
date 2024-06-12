import { LightningElement, wire } from 'lwc';
import getFoodItems from '@salesforce/apex/FoodController.getFoodItems';
 
export default class FoodList extends LightningElement {
    foodItems;
    error;
    
    @wire(getFoodItems)
    wiredFoodItems({ error, data }) {
        if (data) {
            this.foodItems = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.foodItems = undefined;
        }
    }
}