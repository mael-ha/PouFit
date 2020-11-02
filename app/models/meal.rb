class Meal < ApplicationRecord
  belongs_to :session
  validates :name, presence: :true
  validates :name, uniqueness: { scope: :session_id, message: "Une seule fois ce repas par jour!"}
  MEAL_TYPE = ["viande", "poisson", "végétarien", "végétalien"]
  validates :type, inclusion: { in: MEAL_TYPE }
end
