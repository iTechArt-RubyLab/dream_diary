class GoodNightJob
  include Sidekiq::Job

  def perform
    User.find_each do |user|
      NotificationMailer.good_night(user).deliver_now
    end
  end
end
