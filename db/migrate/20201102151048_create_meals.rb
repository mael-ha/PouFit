class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.references :day_session, null: false, foreign_key: true
      t.boolean :eaten
      t.boolean :healthy
      t.string :type

      t.timestamps
    end
  end
end
