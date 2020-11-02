class AddHealthyNoteToMeal < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :heatly_note, :integer
  end
end
