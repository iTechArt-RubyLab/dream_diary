class CategoriesController < ApplicationController
  before_action :find_category, only: :show

  def show
    @dreams = @category.dreams.def_includes.order(created_at: :desc)
    render turbo_stream: turbo_stream.update('dreams_category', partial: 'dreams/dreams',
                                                                locals: { dreams: @dreams })
  end

  private

  def find_category
    @category = Category.find_by(id: params[:id])
  end
end
