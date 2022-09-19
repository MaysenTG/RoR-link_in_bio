import { Controller } from "@hotwired/stimulus"
import "sortablejs"

export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      onEnd: this.end.bind(this)
    })
  }
  end(event) {
    console.log(event);
    // const item = event.item
    // const url = item.dataset.url
    // const data = new FormData()
    // data.append("_method", "put")
    // data.append("position", event.newIndex + 1)

    let id = event.item.dataset.id;
    let url = this.data.get("url").replace(":id", id)
    let data = new FormData();
    
    data.append("position", event.newIndex + 1);
    
    fetch(url, {
      method: "PATCH",
      body: data
    })
    // Rails.ajax({
    //   url: this.data.get("url").replace(":id", id),
    //   type: "PATCH",
    //   data: data
    // })
    // Do a POST request to the URL in the data-url attribute without using Rails.ajax
    
  }
}
