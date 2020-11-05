class WbTable < ApplicationRecord
  belongs_to :ref_workout
  belongs_to :ref_block
end
