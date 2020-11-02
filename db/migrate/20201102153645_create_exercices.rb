class CreateExercices < ActiveRecord::Migration[6.0]
  def change
    create_table :exercices do |t|
      t.string :name
      t.references :base, null: false, foreign_key: true
      t.string :type
      t.integer :timer
      t.integer :number_of_reps
      t.integer :weight_value, default: 0
      t.integer :duration
      t.text :comment
      t.references :workout, null: false, foreign_key: true
      t.integer :time_delay_next, default: 0
      t.integer :index_in_workout
      t.boolean :belongs_to_block
      t.integer :index_in_block
      t.boolean :done, default: false
      t.references :block, null: false, foreign_key: true

      t.timestamps
    end
  end
end
