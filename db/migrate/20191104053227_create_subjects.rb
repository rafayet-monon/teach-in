class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :tution_class_id

      t.timestamps
    end
  end
end
