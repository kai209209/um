class UserMessagesController < ApplicationController
  def create
    @conversation = current_user.all_conversations.find(params[:conversation_id])
    @user_message = @conversation.user_messages.create(content: params[:content], user: current_user)
    render json: @user_message
  end

end
