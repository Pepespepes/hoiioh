class CreateVolunteers < ActiveRecord::Migration[6.1]
  def change
    create_table :volunteers do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.integer :age
      t.boolean :dbs_checked
      t.references :employer, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
