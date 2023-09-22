class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.references :enrollable, polymorphic: true, null: false
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
