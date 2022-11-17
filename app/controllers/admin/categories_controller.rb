class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_AUTHENTICATION_NAME"], password: ENV["HTTP_BASIC_AUTHENTICATION_PASSWORD"]

  def index
    @categories = Categories.order(id: :desc).all
  end
end