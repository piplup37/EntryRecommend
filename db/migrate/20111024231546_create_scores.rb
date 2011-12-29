class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.references :user
      t.references :subject
      t.integer :tensu

      t.timestamps
    end
    add_index :scores, :user_id
    add_index :scores, :subject_id
  end
end
