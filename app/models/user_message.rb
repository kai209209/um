class UserMessage < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  after_create_commit do 
    SendUserMessagesJob.perform_later(self) 
  end

  def receiver
    self.conversation.with(self.user)
  end

  def save_and_perform_job(current_user)
    self.save!
    SendUserMessagesJob.perform_later(self, current_user) 
  end
end
