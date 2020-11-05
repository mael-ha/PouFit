class CreateWbeTables < ActiveRecord::Migration[6.0]
  def change
    create_table :wbe_tables do |t|
      t.references :ref_workout, null: false, foreign_key: true
      t.references :ref_exercice, null: false, foreign_key: true
      t.references :ref_block, null: false, foreign_key: true

      t.timestamps
    end
  end
end
