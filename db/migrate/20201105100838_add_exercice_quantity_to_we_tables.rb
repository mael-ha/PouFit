class AddQuantityToWeWbTables < ActiveRecord::Migration[6.0]
  def change
    add_column :we_tables, :exercice_quantity
  end
end
