class GoodNightJob
  include Sidekiq::Job

  def perform(*args); end
end
