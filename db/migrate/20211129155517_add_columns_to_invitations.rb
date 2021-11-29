class AddColumnsToInvitations < ActiveRecord::Migration[6.1]
  def change
    add_reference :invitations, :inviter, foreign_key: { to_table: :users }, null: false
    add_reference :invitations, :user, foreign_key: true, null: false
  end
end
