require 'rails_helper'

RSpec.describe GoodNightJob, type: :job do
  describe '#perform' do
    let!(:user1) { create(:user) }
    let!(:user2) { create(:user) }

    it 'sends good night email to each user' do
      expect(NotificationMailer).to receive(:good_night).with(user1).and_return(double(deliver_now: true))
      expect(NotificationMailer).to receive(:good_night).with(user2).and_return(double(deliver_now: true))

      GoodNightJob.new.perform
    end
  end
end
