class CommentResource < Avo::BaseResource
  self.title = :id
  self.includes = []

  field :id, as: :id
  field :body, as: :text
  field :user_id, as: :number
  field :dream_id, as: :number
  field :parent_id, as: :number
  field :dream, as: :belongs_to
  field :user, as: :belongs_to
  field :subcomments, as: :has_many
  field :parent, as: :belongs_to
end
