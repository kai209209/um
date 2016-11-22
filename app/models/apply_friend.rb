class ApplyFriend < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :receiver, class_name: "User"

  enum apply_status: [:apply, :pass, :reject]

  
end
