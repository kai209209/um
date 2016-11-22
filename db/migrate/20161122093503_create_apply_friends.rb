class CreateApplyFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :apply_friends do |t|
      t.integer :author_id
      t.integer :receiver_id
      t.text :detail
      t.integer :apply_status

      t.timestamps
    end

    add_index :apply_friends, :author_id
    add_index :apply_friends, :receiver_id
  end
end
