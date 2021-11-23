class CreateEmployers < ActiveRecord::Migration[6.1]
  def change
    create_table :employers do |t|
      t.string :company_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
