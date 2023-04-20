class Comment < ApplicationRecord
  belongs_to :dream
  belongs_to :user
  has_many :subcomments, class_name: 'Comment', foreign_key: 'parent_id', dependent: :destroy, inverse_of: :parent
  belongs_to :parent, class_name: 'Comment', optional: true

  validates :body, presence: true
end
