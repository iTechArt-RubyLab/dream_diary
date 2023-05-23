class PagesController < ApplicationController
  def index
    @dreams = Dream.order(created_at: :desc).limit(12)
  end
end
