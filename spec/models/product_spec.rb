require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    before :each do
      @category = Category.new
    end

    it "saves successfully if a product has all four fields set" do
      params = {
        name: 'Cactus',
        price: 1200,
        quantity: 14,
        category: @category
      }
      @product = Product.new(params)
      @product.save!
      expect(@product.id).to be_present
    end

    it "should have a name validation error within the .errors.full_messages array when name is set to nil" do
      params = {
        name: nil,
        price: 1200,
        quantity: 14,
        category: @category
      }
      @product = Product.new(params)
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "should have a category validation error within the .errors.full_messages array when category is set to nil" do
      params = {
        name: 'Cactus',
        price: 1200,
        quantity: 14,
        category: nil
      }
      @product = Product.new(params)
      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
