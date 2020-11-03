class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :day_sessions
  has_many :workouts, through: :day_sessions
  has_many :ref_workouts
  has_many :ref_blocks
  has_many :ref_exercices
  validates :first_name, :last_name, :username, :email, :birthdate, :gender, presence: :true
  validates :email, :username, uniqueness: :true
end
