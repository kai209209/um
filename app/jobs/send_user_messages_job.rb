class SendUserMessagesJob < ApplicationJob
  queue_as :default

  def perform(user_message, current_user)
    message = render_message(user_message, current_user)
    ActionCable.server.broadcast("user_#{user_message.user.id}_room_channel",
                                  message: message,
                                  conversation_id: user_message.conversation.id,
                                  operate: "send_message")

    ActionCable.server.broadcast("user_#{user_message.receiver.id}_room_channel",
                                  notification: render_user_message_notification(user_message),
                                  message: message,
                                  conversation_id: user_message.conversation.id,
                                  operate: "send_message")
  end

  private

  def render_message(user_message, current_user)
    ApplicationController.render(partial: 'user_messages/user_message', locals: { user_message: user_message, current_user: current_user })
  end

  def render_user_message_notification(user_message)
    ApplicationController.render(partial: 'notification/user_message', locals: { user_message: user_message })
  end
end
