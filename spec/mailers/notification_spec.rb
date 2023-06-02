require 'rails_helper'

RSpec.describe NotificationMailer, type: :mailer do
  describe '#good_night' do
    let(:user) { create(:user, email: 'test@example.com') }
    let(:mail) { NotificationMailer.good_night(user) }

    it 'sends good night email to the user' do
      expect(mail.to).to eq(['test@example.com'])
      expect(mail.subject).to eq('Good night')
      expect(mail.from).to eq(['from@example.com'])
    end
  end
end
