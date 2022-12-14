import { Controller } from "@hotwired/stimulus";
import "sortablejs";

export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      onEnd: this.end.bind(this),
    });
  }
  end(event) {
    let id = event.item.dataset.id;
    let url = this.data.get("url").replace(":id", id);
    let data = new FormData();

    data.append("position", event.newIndex + 1);

    fetch(url, {
      method: "PATCH",
      body: data,
    });
  }
}
