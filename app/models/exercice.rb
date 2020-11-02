class Exercice < ApplicationRecord
  belongs_to :base
  belongs_to :workout
  belongs_to :block
end
