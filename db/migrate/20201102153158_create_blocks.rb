class CreateBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :blocks do |t|
      t.string :name
      t.integer :duration
      t.references :workout, null: false, foreign_key: true
      t.integer :index_in_workout
      t.integer :time_delay_next

      t.timestamps
    end
  end
end
