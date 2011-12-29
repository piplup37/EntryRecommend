class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
      t.references :from_user
      t.references :to_user
      t.text :message
      t.boolean :check
      t.boolean :approval

      t.timestamps
    end
    add_index :friend_requests, :from_user_id
    add_index :friend_requests, :to_user_id
  end
end
