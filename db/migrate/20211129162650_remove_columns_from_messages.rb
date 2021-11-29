class RemoveColumnsFromMessages < ActiveRecord::Migration[6.1]
  def change
    remove_column :messages, :volunteer_id
    remove_column :messages, :charity_id
  end
end
