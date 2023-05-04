class Dream < ApplicationRecord
  belongs_to :user
  belongs_to :category, counter_cache: :dreams_count
  has_many :comments, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  validates :date, presence: true, date: { after: proc { Time.zone.today - 100.years },
                                           before: proc { Time.zone.today } }
  validates :duration, presence: true, numericality: { in: 0..24 }
  validates :title, presence: true, length: { in: 3..50 }
  validates :description, length: { maximum: 500 }
end
