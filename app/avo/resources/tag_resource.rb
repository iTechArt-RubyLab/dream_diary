class TagResource < Avo::BaseResource
  self.title = :id
  self.includes = []

  field :id, as: :id
  field :name, as: :text
  field :dreams, as: :has_and_belongs_to_many
end
