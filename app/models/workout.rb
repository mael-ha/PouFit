class Workout < ApplicationRecord
  belongs_to :session
  has_many :blocks
  has_many :exercices
  validates :name, presence: :true

  def detail
    detail = []
    if self.blocks.any?
      self.blocks.each do |block|
        detail << block
      end
    end

    if self.exercices.any?
      self.exercices.each do |exercice|
        detail << exercice
      end
    end

    detail.sort_by do |element|
      element.index_in_workout
    end

    return detail
  end
end
