class Category < ApplicationRecord
  has_many :dreams, dependent: :nullify
  enum :status, { active: 0, archived: 1 }

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
