class CategoriesController < ApplicationController
  before_action :find_category, only: :show

  def show
    render turbo_stream: turbo_stream.update('dreams_category', partial: 'dreams/dreams',
                                                                locals: { dreams: @category.dreams })
  end

  private

  def find_category
    @category = Category.find_by(id: params[:id])
  end
end
