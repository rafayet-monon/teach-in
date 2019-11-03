class CreateSystemPreferences < ActiveRecord::Migration[6.0]
  def change
    create_table :system_preferences do |t|
      t.string :key, null: false, default: '', unique: true
      t.string :value

      t.timestamps
    end
  end
end
