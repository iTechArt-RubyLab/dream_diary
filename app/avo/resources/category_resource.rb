class CategoryResource < Avo::BaseResource
  self.title = :id
  self.includes = []

  field :id, as: :id
  field :name, as: :text
  field :description, as: :textarea
  field :status, as: :select, enum: ::Category.statuses
  field :dreams_count, as: :number
  field :image, as: :file
  field :dreams, as: :has_many
end
