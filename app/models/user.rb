class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :apply_friends

  def name
    email.split("@").first
  end

  def friends_count
    0
  end

  def friends
    User.all
  end
end
