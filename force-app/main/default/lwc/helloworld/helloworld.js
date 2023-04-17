import { LightningElement } from 'lwc';
export default class HelloWorld extends LightningElement {
  person = 'Human';
  timeOfDay = 'Afternoon';
  changeHandler(event) {
    this.person = event.target.value;
    this.timeOfDay = event.target.value;
  }
}