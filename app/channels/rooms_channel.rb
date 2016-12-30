class RoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from("user_#{current_user.id}_room_channel")
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    conversation = Conversation.find(data["conversation_id"])
    if conversation && conversation.participates?(current_user)
      user_message = current_user.user_messages.new(content: data['messages'], conversation: conversation)
      user_message.save!
    end
  end

end
