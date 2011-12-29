class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :sub_name
      t.integer :credit
      t.integer :year
      t.string :part
      t.string :period
      t.string :kubun
      t.string :ip_comp
      t.string :cs_comp

      t.timestamps
    end
  end
end
