class CreateExercices < ActiveRecord::Migration[6.0]
  def change
    create_table :exercices do |t|
      t.string :name
      t.references :base, null: false, foreign_key: true
      t.string :type
      t.integer :timer
      t.integer :number_of_reps
      t.integer :weight_value
      t.integer :duration
      t.references :workout, null: false, foreign_key: true
      t.integer :time_delay_next
      t.integer :index_in_workout
      t.boolean :belong_to_block
      t.integer :index_in_block
      t.boolean :done
      t.references :block, null: false, foreign_key: true

      t.timestamps
    end
  end
end
