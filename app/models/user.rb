class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :author_apply_friends, class_name: "ApplyFriend", foreign_key: 'author_id'
  has_many :receiver_apply_friends, class_name: "ApplyFriend", foreign_key: 'receiver_id'

  has_many :friends_relationships
  has_many :friends,  through: :friends_relationships, source: :friend

  has_many :user_messages

  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'receiver_id'

  has_many :comments
  has_many :topics

  after_create :generate_avatar

  def friends_count
    0
  end

  def self.search(params, current_user)
    users = User.where("email LIKE ?", "%#{params[:email]}%").where.not(id: current_user.id) if params[:email].present?
    users
  end

  def all_conversations
    Conversation.where("author_id = ? OR receiver_id = ?", self.id, self.id)
  end

  private

  def generate_avatar
    string = Pinyin.t(self.name)
    avatar = LetterAvatar.generate(string, 100)
    self.update_columns(avatar: avatar)
  end

end
