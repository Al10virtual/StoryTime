import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="story-subscription"
export default class extends Controller {
  static values = { storyId: Number }
  static targets = ["story"]

  connect() {
    // console.log("story connected")
    // console.log("target", this.storyTarget)
    // console.log("value", this.storyIdValue)

    this.channel = createConsumer().subscriptions.create(
      { channel: "StoryChannel", id: this.storyIdValue },
      { received: data => this.storyTarget.innerHTML = data.html }
    )
  }
}
