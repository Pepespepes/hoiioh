class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :description, :text
    add_column :users, :age, :integer
    add_column :users, :dbs_checked, :boolean
    add_reference :users, :employer, null: false, foreign_key: true
  end
end
