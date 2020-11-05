class RemoveReferencesForRefElements < ActiveRecord::Migration[6.0]
  def change
    remove_reference :ref_blocks, :ref_workout, index: true
    remove_reference :ref_exercices, :ref_workout, index: true
  end
end
