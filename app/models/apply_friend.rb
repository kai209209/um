class ApplyFriend < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :receiver, class_name: "User"

  enum apply_status: [:apply, :pass, :reject]

  scope :apply_status, -> { where(apply_status: 0) }


  def create_user_friends_relationship
    FriendsRelationship.create(user: self.author, friend: self.receiver)
    FriendsRelationship.create(user: self.receiver, friend: self.author)
    Conversation.create(author: self.author, receiver: self.receiver)
    NotifyFriendsRelationshipJob.perform_later(self.author, self.receiver)
  end
 
end
