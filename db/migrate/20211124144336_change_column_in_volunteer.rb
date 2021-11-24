class ChangeColumnInVolunteer < ActiveRecord::Migration[6.1]
  def change
    change_column_null :volunteers, :employer_id, null: true
  end
end
