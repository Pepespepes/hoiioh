class CreateCharities < ActiveRecord::Migration[6.1]
  def change
    create_table :charities do |t|
      t.string :charity_name
      t.string :category
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
