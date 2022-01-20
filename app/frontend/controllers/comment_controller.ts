import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['replyForm']
  declare readonly replyFormTarget: HTMLElement

  toggleReplyForm(event) {
    event.preventDefault();
    this.replyFormTarget.classList.toggle('d-none');
  }
}
