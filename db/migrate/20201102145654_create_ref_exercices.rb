class CreateRefExercices < ActiveRecord::Migration[6.0]
  def change
    create_table :ref_exercices do |t|
      t.string :name
      t.references :base, null: false, foreign_key: true
      t.string :ref_exercice_type
      t.integer :timer
      t.integer :number_of_reps
      t.integer :weight_value
      t.integer :duration
      t.text :comment
      t.references :ref_workout, null: false, foreign_key: true
      t.integer :time_delay_next
      t.integer :index_in_workout
      t.boolean :belongs_to_block
      t.integer :index_in_block
      t.references :ref_block, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
