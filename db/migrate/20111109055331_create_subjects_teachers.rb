class CreateSubjectsTeachers < ActiveRecord::Migration
  def change
    create_table :subjects_teachers do |t|
      t.references :subject
      t.references :teacher

      t.timestamps
    end
    add_index :subjects_teachers, :subject_id
    add_index :subjects_teachers, :teacher_id
  end
end
