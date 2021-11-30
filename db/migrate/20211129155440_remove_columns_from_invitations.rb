class RemoveColumnsFromInvitations < ActiveRecord::Migration[6.1]
  def change
    remove_column :invitations, :volunteer_id
    remove_column :invitations, :charity_id
  end
end
