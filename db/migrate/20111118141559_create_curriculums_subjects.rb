class CreateCurriculumsSubjects < ActiveRecord::Migration
  def change
    create_table :curriculums_subjects do |t|
      t.references :curriculum
      t.references :subject

      t.timestamps
    end
    add_index :curriculums_subjects, :curriculum_id
    add_index :curriculums_subjects, :subject_id
  end
end
