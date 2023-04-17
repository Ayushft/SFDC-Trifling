import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import PLAYER_OBJECT from '@salesforce/schema/Player__c';
import NAME_FIELD from '@salesforce/schema/Player__c.Name';
import DATEOFBIRTH_FIELD from '@salesforce/schema/Player__c.Date_Of_Birth__c';
import AGE_FIELD from '@salesforce/schema/Player__c.Age__c';
import NATIONALITY_FIELD from '@salesforce/schema/Player__c.Nationality__c'
import PLAYERNATIONALITY_FIELD from '@salesforce/schema/Player__c.Player_Nationality__c';
import POSITION__FIELD from '@salesforce/schema/Player__c.Position__c';
import CLUB_FIELD from '@salesforce/schema/Player__c.Club__c'
export default class PlayerCreator extends LightningElement {
    objectApiName = PLAYER_OBJECT;
    fields = [NAME_FIELD,DATEOFBIRTH_FIELD,AGE_FIELD,NATIONALITY_FIELD,PLAYERNATIONALITY_FIELD,CLUB_FIELD,POSITION__FIELD];
    handleSuccess(event) {
        const toastEvent = new ShowToastEvent({
            title: "Player created",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
    }
}