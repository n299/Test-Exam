# frozen_string_literal: true

class SearchService
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def perform
    search_by_name(User.all)
  end

  private

  def search_by_name(users)
    return users if search_param.blank?
    users.search_by_name(search_param)
  end

  def search_param
    params[:search]
  end
end
