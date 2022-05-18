class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  # def new
  #   @category = Category.new
  # end

  # def create
  #   @category = Category.find(params[:id])
  #   if @category.save
  #     redirect_to 
  # end

  # def show
  # end

  # def delete
  # end
end
