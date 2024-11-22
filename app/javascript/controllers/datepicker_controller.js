import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()
import rangePlugin from "flatpickrRangePlugin";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = [ 'startDateInput', 'endDateInput' ]
// On controller's connection, call the flatpickr
// function in order to build the calendars
  connect() {
    flatpickr(this.startDateInputTarget, {
      minDate: "today",
      plugins: [new rangePlugin({ input: this.endDateInputTarget})]
    })
  }
}
