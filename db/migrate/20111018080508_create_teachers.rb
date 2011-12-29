class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :t_name

      t.timestamps
    end
  end
end
