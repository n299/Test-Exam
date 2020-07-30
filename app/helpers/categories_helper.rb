# frozen_string_literal: true

module CategoriesHelper
  def categories_size
    Category.all.size
  end
end
