import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "lever"];

  static classes = ["active", "inactive", "activeLever", "inactiveLever"];

  static values = {
    checked: {
      type: Boolean,
      default: false,
    },
  };

  connect() {
    if (this.checkedValue) this.toggle();
  }

  toggle(event) {
    this.element.ariaChecked =
      this.element.ariaChecked == "true" ? false : true;

    if (this.hasInputTarget)
      this.inputTarget.value = this.element.ariaChecked == "true";

    this.element.classList.toggle(...this.activeClasses);
    this.element.classList.toggle(...this.inactiveClasses);

    this.leverTarget.classList.toggle(...this.activeLeverClasses);
    this.leverTarget.classList.toggle(...this.inactiveLeverClasses);
  }
}
