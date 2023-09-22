class CreateTeachingLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :teaching_levels do |t|
      t.string :codigo, null: false, limit: 5
      t.string :description

      t.timestamps
    end
  end
end
