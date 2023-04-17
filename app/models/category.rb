class Category < ApplicationRecord
  has_many :dreams, dependent: :nullify
  enum :status, %i[active archived]

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
