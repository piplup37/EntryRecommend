class AddConfirmableToUsers < ActiveRecord::Migration
  def change
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_index :users, :confirmation_token, :unique => true
    
    User.update_all({:confirmed_at => DateTime.now, :confirmation_token => "Grandfathered Account", :confirmation_sent_at => DateTime.now})
  end

  def self.down
    remove_column :users, [:confirmed_at, :confirmation_token, :confirmation_sent_at]
  end
end
