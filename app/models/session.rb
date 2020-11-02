class Session < ApplicationRecord
  belongs_to :user
  has_many :workouts
  validates :date, uniqueness: true
  validates :date, presence: :true
end
