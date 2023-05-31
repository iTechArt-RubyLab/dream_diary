class Dream < ApplicationRecord
  searchkick
  scope :search_import, -> { includes(:tags) }

  belongs_to :user
  belongs_to :category, counter_cache: :dreams_count
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags
  has_one_attached :image, dependent: :destroy

  validates :date, presence: true, date: { after: proc { Time.zone.today - 100.years },
                                           before: proc { Time.zone.tomorrow } }
  validates :duration, presence: true, numericality: { in: 0..24 }
  validates :title, presence: true, length: { in: 3..50 }
  validates :description, length: { maximum: 500 }

  def search_data
    {
      title:,
      description:,
      date:,
      tags: tags.map(&:name)
    }
  end

  def to_csv
    CSV.generate do |csv|
      csv << %w[title description category_name user_name tags]
      csv << [title, description, category.name, user.name, tags.map(&:name).join(',')]
    end
  end
end
