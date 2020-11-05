class RenameWbeTablesToWbTables < ActiveRecord::Migration[6.0]
  def change
    rename_table :wbe_tables, :wb_tables
    remove_reference :wb_tables, :ref_exercice, index: true
  end
end
