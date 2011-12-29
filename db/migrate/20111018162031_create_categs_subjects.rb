class CreateCategsSubjects < ActiveRecord::Migration
  def change
    create_table :categs_subjects, :id => false do |t|
      t.references :categ
      t.references :subject
    end
    add_index :categs_subjects, :categ_id
    add_index :categs_subjects, :subject_id
  end
end
