class CreateFriendsRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :friends_relationships do |t|
      t.integer :user_id
      t.integer :friend_id
      t.string :nick_name
      t.integer :group_id


      t.timestamps
    end

    add_index :friends_relationships, :user_id
    add_index :friends_relationships, :friend_id
    add_index :friends_relationships, :group_id
  end
end
