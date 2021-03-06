class ConversationsController < ApplicationController

  def show
    @conversation = current_user.all_conversations.find(params[:id])
    @user_messages = @conversation.user_messages.limit(50).order(id: :asc)
    @user_message = UserMessage.new
    respond_to do |format|
      format.js
      format.html
      format.json
    end
  end

  def chat_with_friend_conversation
    user = User.find(params[:friend_id])
    @conversation = Conversation.between(current_user, user)
    @user_messages = @conversation.user_messages.limit(50).order(id: :desc)
    respond_to do |format|
      format.json
    end
  end

end
