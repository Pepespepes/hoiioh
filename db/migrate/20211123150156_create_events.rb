class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :location
      t.date :date
      t.time :start_time
      t.integer :duration
      t.text :description
      t.integer :number_positions
      t.references :charity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
