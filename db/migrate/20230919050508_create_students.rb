class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, limit: 255, null: false

      t.timestamps
    end
  end
end
