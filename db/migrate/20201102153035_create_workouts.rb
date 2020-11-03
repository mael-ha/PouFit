class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :name
      t.integer :duration
      t.integer :index
      t.references :day_session, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.integer :duration_theorical

      t.timestamps
    end
  end
end
