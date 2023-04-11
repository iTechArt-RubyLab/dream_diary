class User < ApplicationRecord
  has_many :dreams, dependent: :destroy
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :validatable, :confirmable,
         omniauth_providers: %i[google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.avatar_url = auth.info.image
      user.skip_confirmation!
      user.save!
    end
  end
end
