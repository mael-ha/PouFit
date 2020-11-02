class RefWorkout < ApplicationRecord
  belongs_to :user
  has_many :ref_blocks
  has_many :ref_exercices
  validates :name, presence: :true

  def detail
    detail = []
    if self.ref_blocks.any?
      self.ref_blocks.each do |ref_block|
        detail << ref_block
      end
    end

    if self.ref_exercices.any?
      self.ref_exercices.each do |ref_exercice|
        detail << ref_exercice
      end
    end

    detail.sort_by do |element|
      element.index_in_workout
    end

    return detail
  end
end
