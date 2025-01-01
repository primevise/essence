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
    const tab = event.target.nextElementSibling;
    if (!tab) return;
    tab.click();
    tab.focus();
  }

  previous(event) {
    const tab = event.target.previousElementSibling;
    if (!tab) return;
    tab.click();
    tab.focus();
  }
}
