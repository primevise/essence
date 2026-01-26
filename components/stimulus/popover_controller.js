import { Controller } from "@hotwired/stimulus";
import {
  computePosition,
  offset,
  flip,
  shift,
  autoUpdate,
} from "@floating-ui/dom";

export default class extends Controller {
  static targets = ["trigger", "content"];
  static values = {
    open: { type: Boolean, default: false },
    placement: { type: String, default: "top" },
    offset: { type: Number, default: 8 },
    shift: { type: Number, default: 8 },
    delay: { type: Number, default: 64 },
  };

  connect() {
    this.delayTimeout = null;

    this.cleanup = autoUpdate(this.triggerTarget, this.contentTarget, () => {
      computePosition(this.triggerTarget, this.contentTarget, {
        placement: this.placementValue,
        middleware: [
          offset(this.offsetValue),
          flip(),
          shift({ padding: this.shiftValue }),
        ],
      }).then(({ x, y }) => {
        this.contentTarget.style.transform = `translate(${this.#roundByDPR(x)}px,${this.#roundByDPR(y)}px)`;
      });
    });
  }

  disconnect() {
    this.cleanup();
  }

  toggle = (event) => {
    this.openValue = !this.openValue;
  };

  open = (event) => {
    event.stopPropagation();
    clearTimeout(this.delayTimeout);
    this.openValue = true;
  };

  close = (event) => {
    event.stopPropagation();
    this.delayTimeout = setTimeout(() => {
      this.openValue = false;
    }, this.delayValue);
  };

  openValueChanged(state, _) {
    this.element.dataset.popoverState = state ? "open" : "closed";
    this.triggerTarget.setAttribute("aria-expanded", state);
    this.contentTarget.setAttribute("aria-hidden", !state);
  }

  #roundByDPR = (value) => {
    const dpr = window.devicePixelRatio || 1;
    return Math.round(value * dpr) / dpr;
  };
}
