class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :author_apply_friends, class_name: "ApplyFriend", foreign_key: 'author_id'
  has_many :receiver_apply_friends, class_name: "ApplyFriend", foreign_key: 'receiver_id'

  def name
    email.split("@").first
  end

  def friends_count
    0
  end

  def friends
    User.all
  end

  def self.search(params)
    users = User.where("email LIKE ?", "%#{params[:email]}%") if params[:email].present?
    users
  end
end
