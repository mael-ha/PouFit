class Exercice < ApplicationRecord
  belongs_to :base
  belongs_to :workout
  belongs_to :block
  validates :name, :exercice_type, presence: :true
  REF_EXERCICE_TYPE = ["reps", "timer"]
  validates :exercice_type, inclusion: { in: REF_EXERCICE_TYPE }

  def belongs_to_block?
    block_id = nil ? false : true
  end

  def done?
    return done
  end
end
