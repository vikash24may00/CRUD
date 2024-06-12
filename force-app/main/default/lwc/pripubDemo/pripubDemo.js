import { LightningElement,api} from 'lwc';

export default class PripubDemo extends LightningElement 
{
    message = 'public property';
    @api recordId;
}