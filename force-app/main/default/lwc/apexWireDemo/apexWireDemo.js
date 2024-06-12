import { LightningElement, wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountController.getAccountList'

export default class ApexWireDemo extends LightningElement {
    accountList

    @wire(getAccountList)
    accounts

    @wire(getAccountList)
    accountHandler({ data, error }) {
        if (data) {
            console.log(data)
            this.accountList = data.map(item => {
                let newType = item.Type === 'Cutomer - Channel' ? 'Channel' :
                    item.type == 'Customer - Direct' ? 'Direct' : '--------'
                return { ...item, newType }
            })
        }
        if (error) {
            console.log(error)
        }
    }
}