class ChangeLocationInEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :location
    add_column :events, :address, :text
  end
end
