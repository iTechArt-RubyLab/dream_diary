class DreamResource < Avo::BaseResource
  self.title = :id
  self.includes = []

  field :id, as: :id
  field :date, as: :date
  field :duration, as: :number
  field :title, as: :text
  field :description, as: :textarea
  field :user_id, as: :number
  field :category_id, as: :number
  field :image, as: :file
  field :user, as: :belongs_to
  field :category, as: :belongs_to
  field :comments, as: :has_many

  action ExportCsv
end
