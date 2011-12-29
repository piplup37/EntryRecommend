class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :user
      t.references :subject

      t.timestamps
    end
    add_index :entries, :user_id
    add_index :entries, :subject_id
  end
end
