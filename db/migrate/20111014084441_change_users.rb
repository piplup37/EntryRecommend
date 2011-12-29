class ChangeUsers < ActiveRecord::Migration
  def up
  	change_table :users do |t|
  		t.string :no
  		t.string :user_name
  		t.string :cource
  		t.integer :lank
  	end
  end

  def down
  	change_table :users do |t|
  		t.remove :no, :user_name, :cource, :lank,
  	end
  end
end
