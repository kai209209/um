class AddNameToNameColumn < ActiveRecord::Migration[5.0]
  def change
    User.all.each do |user|
      user.update_column('name', user.email.split("@").first)
    end
  end
end
