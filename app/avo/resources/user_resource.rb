class UserResource < Avo::BaseResource
  self.title = :id
  self.includes = []

  field :id, as: :id
  field :name, as: :text
  field :email, as: :text
  field :confirmation_token, as: :text
  field :confirmed_at, as: :date_time
  field :confirmation_sent_at, as: :date_time
  field :unconfirmed_email, as: :text
  field :uid, as: :text
  field :avatar_url, as: :text
  field :provider, as: :text
  field :status, as: :select, enum: ::User.statuses
  field :role, as: :select, enum: ::User.roles
  field :avatar, as: :file
  field :dreams, as: :has_many
  field :comments, as: :has_many
end
