class CreateTutionClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :tution_classes do |t|
      t.string :name
      t.integer :level

      t.timestamps
    end
  end
end
