class CreateCurriculums < ActiveRecord::Migration
  def change
    create_table :curriculums do |t|
      t.references :user
      t.integer :lank
      t.text :explain

      t.timestamps
    end
    add_index :curriculums, :user_id
  end
end
