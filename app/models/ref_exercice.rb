class RefExercice < ApplicationRecord
  belongs_to :base
  belongs_to :ref_workout
  belongs_to :ref_block
  belongs_to :user
  validates :name, :type, presence: :true
  REF_EXERCICE_TYPE = %[reps timer]
  validates :type, inclusion: { in: REF_EXERCICE_TYPE }
end
