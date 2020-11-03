class Meal < ApplicationRecord
  belongs_to :day_session
  validates :name, presence: :true
  validates :name, uniqueness: { scope: :day_session_id, message: "Une seule fois ce repas par jour!"}
  MEAL_TYPE = ["viande", "poisson", "végétarien", "végétalien"]
  validates :type, inclusion: { in: MEAL_TYPE }

  def eaten?
    return eaten
  end

  def healthy?
    return healthy
  end
end
