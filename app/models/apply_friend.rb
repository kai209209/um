class ApplyFriend < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :receiver, class_name: "User"

  enum apply_status: [:apply, :pass, :reject]

  scope :apply_status, -> { where(apply_status: 0) }

  
end
