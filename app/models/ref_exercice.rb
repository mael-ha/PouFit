class RefExercice < ApplicationRecord
  belongs_to :base
  belongs_to :user
  has_many :wbe_tables
  validates :name, :ref_exercice_type, presence: :true
  REF_EXERCICE_TYPE = ["reps", "timer"]
  validates :ref_exercice_type, inclusion: { in: REF_EXERCICE_TYPE }

  def belongs_to_block?
    ref_block_id = nil ? false : true
  end
end
