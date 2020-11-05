class RefBlock < ApplicationRecord
  belongs_to :user
  has_many :wbe_tables
  validates :name, presence: :true
end
