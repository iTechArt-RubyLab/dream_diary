class ReindexTagsJob
  include Sidekiq::Job

  def perform
    Dream.reindex
  end
end
