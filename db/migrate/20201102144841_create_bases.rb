class CreateBases < ActiveRecord::Migration[6.0]
  def change
    create_table :bases do |t|
      t.string :name
      t.string :base_type
      t.string :muscular_group

      t.timestamps
    end
  end
end
