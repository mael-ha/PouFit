class AddNumberOfSetsToWbeTable < ActiveRecord::Migration[6.0]
  def change
    add_column :wbe_tables, :number_of_sets, :integer, default: 1
  end
end
