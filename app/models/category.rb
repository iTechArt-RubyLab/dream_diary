class Category < ApplicationRecord
  has_many :dreams, dependent: :nullify
  has_one_attached :image, dependent: :destroy
  enum :status, { active: 0, archived: 1 }

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
