class User < ApplicationRecord
  has_many :dreams, dependent: :destroy
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :validatable, :confirmable
end
