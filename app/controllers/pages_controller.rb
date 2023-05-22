class PagesController < ApplicationController
  skip_authorize_resource

  def index
    @dreams = Dream.order(created_at: :desc).limit(12)
  end
end
