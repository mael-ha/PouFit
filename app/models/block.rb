class Block < ApplicationRecord
  belongs_to :workout
  has_many :ref_exercices
  validates :name, presence: :true
end
