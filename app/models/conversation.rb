class Conversation < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_many :user_messages

  validates :author, uniqueness: { scope: :receiver }

  scope :between, -> (author_id, receiver_id) { where(author_id: author_id, receiver_id: receiver_id).or(where(author_id: receiver_id, receiver_id: author_id)).take }

  def with(current_user)
    author == current_user ? receiver : author
  end

  def participates?(user)
    author == user || receiver == user
  end
end
