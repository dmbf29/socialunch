class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   validates :first_name, :last_name, :birthday, :bio, presence: true
   validates :smoking, inclusion: { in: [true, false] }
   has_many :lunch_requests
   has_many :lunch_dates
   has_many :restaurants, through: :lunch_dates
end
