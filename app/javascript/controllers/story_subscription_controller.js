import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="story-subscription"
export default class extends Controller {
  static values = { storyId: Number }
  static targets = ["story", "text", "audio", "image"]

  connect() {
    // console.log("story connected")
    // console.log("target", this.storyTarget)
    // console.log("value", this.storyIdValue)
    // console.log(this.spinnerTarget)

    this.channel = createConsumer().subscriptions.create(
      { channel: "StoryChannel", id: this.storyIdValue },
      { received: this.handleReceivedData.bind(this) }
    )
  }

  handleReceivedData(data) {
    if (data.step && data.step === "text") {
      console.log("text recu");
      this.textTarget.innerHTML = "✅"
    } else if (data.step && data.step === "audio") {
      console.log("audio recu");
      this.audioTarget.innerHTML = "✅"
    } else if (data.step && data.step === "image") {
      console.log("image recue");
      this.imageTarget.innerHTML = "✅";
      setTimeout(() => {
        console.log(data.html);
        this.storyTarget.outerHTML = data.html
      }, 2000)
    }
  }
}
