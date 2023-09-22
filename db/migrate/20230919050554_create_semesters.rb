class CreateSemesters < ActiveRecord::Migration[7.0]
  def change
    create_table :semesters do |t|
      t.string :current_semester, null: false, limit: 8
      t.string :current_semester_code, limit: 2
      t.string :description

      t.timestamps
    end
  end
end
