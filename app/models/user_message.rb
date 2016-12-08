class UserMessage < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  after_create_commit do 
    SendUserMessagesJob.perform_later(self) 
  end

  def receiver
    self.conversation.with(self.user)
  end

end
