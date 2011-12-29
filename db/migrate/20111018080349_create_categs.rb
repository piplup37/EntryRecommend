class CreateCategs < ActiveRecord::Migration
  def change
    create_table :categs do |t|
      t.string :categ_name

      t.timestamps
    end
  end
end
