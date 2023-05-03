class Dream < ApplicationRecord
  belongs_to :user
  belongs_to :category, counter_cache: :dreams_count
  has_many :comments, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end
