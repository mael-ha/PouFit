class RefExercice < ApplicationRecord
  belongs_to :base
  belongs_to :ref_workout
  belongs_to :ref_block
  belongs_to :user
end
