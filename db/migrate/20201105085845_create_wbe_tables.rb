class CreateWbeTables < ActiveRecord::Migration[6.0]
  def change
    create_table :wbe_tables do |t|
      t.references :ref_workout, null: true, foreign_key: true
      t.references :ref_exercice, null: true, foreign_key: true
      t.references :ref_block, null: true, foreign_key: true

      t.timestamps
    end
  end
end
