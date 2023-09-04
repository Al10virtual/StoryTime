class StoryChannel < ApplicationCable::Channel
  def subscribed
    story = Story.find(params[:id])
    stream_for story
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
