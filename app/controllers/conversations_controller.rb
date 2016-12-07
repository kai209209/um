class ConversationsController < ApplicationController

  def show
    @conversation = current_user.all_conversations.find(params[:id])
    @user_messages = @conversation.user_messages.limit(50).order(id: :asc)
    @user_message = UserMessage.new
    respond_to do |format|
      format.js
      format.html
    end
  end

end
