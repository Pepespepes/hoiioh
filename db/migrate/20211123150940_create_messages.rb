class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.boolean :sent_by_charity
      t.references :charity, null: false, foreign_key: true
      t.references :chatroom, null: false, foreign_key: true
      t.references :volunteer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
