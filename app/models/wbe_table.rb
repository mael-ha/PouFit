class WbeTable < ApplicationRecord
  belongs_to :ref_workout, optional: true
  belongs_to :ref_block, optional: true
  belongs_to :ref_exercice, optional: true
end
