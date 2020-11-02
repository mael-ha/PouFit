class RefBlock < ApplicationRecord
  belongs_to :ref_workout
  belongs_to :user
end
