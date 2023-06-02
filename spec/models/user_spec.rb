require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:dreams) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_one_attached(:avatar) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to allow_value('email@example.com').for(:email) }
    it { is_expected.to_not allow_value('email').for(:email) }
  end

  describe 'enums' do
    it { is_expected.to define_enum_for(:status).with_values(active: 0, blocked: 1) }
    it { is_expected.to define_enum_for(:role).with_values(user: 0, admin: 1) }
  end

  describe '.from_omniauth' do
    let(:auth) do
      OmniAuth::AuthHash.new(provider: 'google_oauth2', uid: '123456789',
                             info: { email: 'test@example.com', name: 'Test User',
                                     image: 'http://example.com/avatar.jpg' })
    end

    context 'when user exists' do
      let!(:existing_user) do
        create(:user, provider: 'google_oauth2', uid: '123456789', email: 'test@example.com', name: 'Test User',
                      avatar_url: 'http://example.com/avatar.jpg')
      end

      it 'does not create a new user' do
        expect do
          User.from_omniauth(auth)
        end.to_not change(User, :count)
      end

      it 'returns the existing user' do
        expect(User.from_omniauth(auth)).to eq(existing_user)
      end

      it 'updates the user attributes' do
        user = User.from_omniauth(auth)
        expect(user.provider).to eq('google_oauth2')
        expect(user.uid).to eq('123456789')
        expect(user.email).to eq('test@example.com')
        expect(user.name).to eq('Test User')
        expect(user.avatar_url).to eq('http://example.com/avatar.jpg')
      end
    end
  end
end
