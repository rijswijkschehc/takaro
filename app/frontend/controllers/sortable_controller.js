import { Controller } from 'stimulus';
import Rails from '@rails/ujs';
import Sortable from 'sortablejs';

export default class extends Controller {
  connect() {
    this.sortable = new Sortable(this.element, {
      animation: 150,
      handle: '.sortable-handle',
      onEnd: this.reposition.bind(this),
    });
  }

  disconnect() {
    this.sortable.destroy();
    this.sortable = undefined;
  }

  reposition(event) {
    const url = event.target.dataset.repositionPath;
    const data = new FormData();

    data.set('id', event.item.dataset.id);
    data.set('position', event.newIndex + 1);

    Rails.ajax({ url, data, type: 'PATCH' });
  }
}
