class WbeTable < ApplicationRecord
  belongs_to :ref_workout
  belongs_to :ref_exercice
  belongs_to :ref_block
end
