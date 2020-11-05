class Base < ApplicationRecord
  validates :name, :base_type, :muscular_group, presence: :true
  validates :name, uniqueness: :true
  BASE_TYPE = ["Effort", "Étirement"]
  validates :base_type, inclusion: { in: BASE_TYPE }
  MUSCULAR_GROUP = ["bras", "pecs", "abdos", "dos", "jambes", "mix haut", "mix bas", "full-body"]
  validates :muscular_group, inclusion: { in: MUSCULAR_GROUP }
end
