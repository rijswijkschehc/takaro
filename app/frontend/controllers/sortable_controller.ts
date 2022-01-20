import { Controller } from 'stimulus';
import Sortable from 'sortablejs';

export default class extends Controller {
  sortable: Sortable

  connect() {
    this.sortable = new Sortable((this.element as HTMLElement), {
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
    const data = {
      id: event.item.dataset.id,
      position: event.newIndex + 1,
    };

    fetch(url, {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': (document.querySelector('meta[name=csrf-token]') as HTMLMetaElement).content,
      },
      body: JSON.stringify(data),
    });
  }
}
