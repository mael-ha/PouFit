class CreateDaySessions < ActiveRecord::Migration[6.0]
  def change
    create_table :day_sessions do |t|
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
