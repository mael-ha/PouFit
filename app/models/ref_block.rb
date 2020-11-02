class RefBlock < ApplicationRecord
  belongs_to :ref_workout
  belongs_to :user
  has_many :ref_exercices
  validates :name, presence: :true
end
