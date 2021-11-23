class AddColumnsToCharity < ActiveRecord::Migration[6.1]
  def change
    add_column :charities, :charity_name, :string
    add_column :charities, :category, :string
    add_column :charities, :description, :text
  end
end
