# frozen_string_literal: true

module Admins
  class CategoriesController < BaseController
    before_action :set_category, only: %i[edit update destroy]

    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def edit; end

    def create
      @category = Category.new category_params
      if @category.save
        redirect_to admins_categories_path
      else
        render :new
      end
    end

    def update
      if @category.update_attributes(category_params)
        redirect_to admins_categories_path
      else
        render :edit
      end
    end

    def destroy
      return redirect_to admins_categories_path if @category.destroy
    end

    private

    def category_params
      params.require(:category).permit(:content)
    end

    def set_category
      @category = Category.find_by(id: params[:id])
      return redirect_to(admins_categories_url, alert: 'Category not exit') if @category.blank?
    end
  end
end
