class CreateRefBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :ref_blocks do |t|
      t.string :name
      t.references :ref_workout, null: false, foreign_key: true
      t.integer :index_in_workout
      t.integer :time_delay_next
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
