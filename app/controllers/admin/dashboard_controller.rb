class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_AUTHENTICATION_NAME"], password: ENV["HTTP_BASIC_AUTHENTICATION_PASSWORD"]

  def show
    @total_products = Product.sum(:quantity)
    @total_categories = Category.count(:all)
  end
end
