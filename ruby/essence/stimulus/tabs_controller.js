import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["tab", "panel"];
  static values = { active: String };

  setActiveTab(event) {
    this.activeValue = event.params.panelId;
  }

  activeValueChanged() {
    this.tabTargets.forEach((tab) => {
      tab.ariaSelected = tab.id === this.activeValue;
    });

    this.panelTargets.forEach((panel) => {
      panel.ariaHidden = panel.id !== this.activeValue;
    });
  }

  next(event) {
    this.navigate(event, "next");
  }

  previous(event) {
    this.navigate(event, "previous");
  }

  navigate(event, direction) {
    const tab =
      direction === "next"
        ? event.target.nextElementSibling
        : event.target.previousElementSibling;

    if (!tab) return;

    tab.click();
    tab.focus();
  }
}
