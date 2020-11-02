class AddDailyNoteToMeal < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :daily_note, :integer
  end
end
