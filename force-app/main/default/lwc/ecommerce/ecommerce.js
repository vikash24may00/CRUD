import { LightningElement, track, wire } from 'lwc';
import getProducts from '@salesforce/apex/ProductController.getProducts';
import getProductById from '@salesforce/apex/ProductController.getProductById';
import placeOrder from '@salesforce/apex/ProductController.placeOrder';

const COLUMNS = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Price', fieldName: 'Price__c', type: 'currency' },
    { type: 'button', typeAttributes: { label: 'View Details', name: 'view_details' } }
];

export default class EcommerceApp extends LightningElement {
     products;
     selectedProduct;
     cartItems = [];
     totalPrice = 0;
    showProductList = true;
    showProductDetail = false;
    showCart = false;
    showCheckout = false;
    columns = COLUMNS;

    @wire(getProducts)
    wiredProducts({ error, data }) {
        if (data) {
            this.products = data;
        } else if (error) {
            // Handle error
        }
    }

    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;
        if (actionName === 'view_details') {
            this.fetchProductDetails(row.Id);
        }
    }

    fetchProductDetails(productId) {
        getProductById({ productId })
            .then(result => {
                this.selectedProduct = result;
                this.showProductList = false;
                this.showProductDetail = true;
            })
            .catch(error => {
                // Handle error
            });
    }

    addToCart() {
        this.cartItems = [...this.cartItems, this.selectedProduct];
        this.showProductDetail = false;
        this.showProductList = true;
    }

    backToList() {
        this.showProductDetail = false;
        this.showProductList = true;
    }

    checkout() {
        this.totalPrice = this.cartItems.reduce((acc, item) => acc + item.Price__c, 0);
        this.showCart = false;
        this.showCheckout = true;
    }

    placeOrder() {
        placeOrder({ items: this.cartItems })
            .then(() => {
                // Handle success
                this.cartItems = [];
                this.showCheckout = false;
                this.showProductList = true;
            })
            .catch(error => {
                // Handle error
            });
    }

    connectedCallback() {
        this.showCart = true;
    }
}