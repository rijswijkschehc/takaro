import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['target', 'template']

  targetTarget: HTMLElement
  templateTarget: HTMLElement

  addAssociation(event) {
    event.preventDefault();

    const content = this.templateTarget.innerHTML.replace(/TEMPLATE/g, new Date().getTime().toString());
    this.targetTarget.insertAdjacentHTML('beforebegin', content);
  }

  removeAssociation(event) {
    event.preventDefault();

    const wrapper = event.target.closest('.nested-fields');

    if (wrapper.dataset.newRecord === 'true') {
      wrapper.remove();
    } else {
      wrapper.style.display = 'none';
      wrapper.querySelector("input[name*='_destroy']").value = 1;
    }
  }
}
