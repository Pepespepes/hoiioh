class AddColumnsToEmployer < ActiveRecord::Migration[6.1]
  def change
    add_column :employers, :company_name, :string
  end
end
