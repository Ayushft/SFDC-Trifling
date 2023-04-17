import { LightningElement, wire } from 'lwc';
import { reduceErrors } from 'c/ldsUtils';
import getPlayers from '@salesforce/apex/PlayerController.getPlayers';
import NAME_FIELD from '@salesforce/schema/Player__c.Name';
/*import PLAYER_OBJECT from '@salesforce/schema/Player__c';
import DATEOFBIRTH_FIELD from '@salesforce/schema/Player__c.Date_Of_Birth__c';
import AGE_FIELD from '@salesforce/schema/Player__c.Age__c';
import NATIONALITY_FIELD from '@salesforce/schema/Player__c.Nationality__c'
import PLAYERNATIONALITY_FIELD from '@salesforce/schema/Player__c.Player_Nationality__c';
import POSITION__FIELD from '@salesforce/schema/Player__c.Position__c';
import CLUB_FIELD from '@salesforce/schema/Player__c.Club__c';
import CLUBNAME_FIELD from '@salesforce/schema/Player__c.Club__r.Name';
import getPlayers from '@salesforce/apex/PlayerController.getPlayers';*/
/* fields = [NAME_FIELD,DATEOFBIRTH_FIELD,AGE_FIELD,NATIONALITY_FIELD,PLAYERNATIONALITY_FIELD,CLUB_FIELD,POSITION__FIELD];*/
const COLUMNS = [
    /*{ label: 'Name', fieldName: Player__c.Name, type: 'url' },
    { label: 'DOB', fieldName: DATEOFBIRTH_FIELD.fieldApiName, type: 'date' },
    { label: 'Age', fieldName: AGE_FIELD.fieldApiName, type: 'number' },
    { label: 'Nationality', fieldName: NATIONALITY_FIELD.fieldApiName, type: 'text'},
    { label: 'Club', fieldName: CLUB_FIELD.fieldApiName, type: 'Id'},
    { label:'Club Name', fieldName: CLUBNAME_FIELD, type:'text'},
    { label: 'Positions', fieldName: POSITION__FIELD.fieldApiName, type:'text'}*/

    {label : 'Player Name', fieldName: NAME_FIELD.fieldApiName, type:'url',typeAttributes:{label:{fieldName:NAME_FIELD.fieldApiName},target:'_blank'}},
    {label : 'DOB', fieldName: 'Date_Of_Birth__c', type:'date'},
    {label:'Age',fieldName:'Age__c',type:'number'},
    {label:'Nationality',fieldName:'Nationality__c',type:'text'},
    {label:'Club Name',fieldName:'Club__c',type:'text'},
    {label:'Positions',fieldName:'Position__c',type:'text'}
];
export default class PlayerList extends LightningElement {
    PlayersData;
    error;
    columns = COLUMNS;
    @wire(getPlayers)
    wiredPlayers({error,data}){
        if(data){

            let tempRecs = [];
            data.forEach((record)=>{
                let tempRec = Object.assign({},record);
                tempRec.Name = '/' + tempRec.Id;
                tempRec.Club__c = tempRec.Club__r.Name;
                tempRecs.push(tempRec);
            });
            this.PlayersData = tempRecs;
            this.error = undefined;
        }
    else if ( error ) {

        this.error = error;
        this.PlayersData = undefined;

    }
}
}