class CreateInstructors < ActiveRecord::Migration[7.0]
  def change
    create_table :instructors do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, limit: 255, null: false
      t.boolean :status, default: true

      t.timestamps
    end
    add_index :instructors, :email, unique: true
  end
end
