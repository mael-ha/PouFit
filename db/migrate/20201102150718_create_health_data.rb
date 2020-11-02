class CreateHealthData < ActiveRecord::Migration[6.0]
  def change
    create_table :health_data do |t|
      t.references :session, null: false, foreign_key: true
      t.integer :body_weight_main
      t.integer :body_weight_second
      t.integer :body_weight
      t.integer :muscular_mass
      t.integer :fat_mass

      t.timestamps
    end
  end
end
