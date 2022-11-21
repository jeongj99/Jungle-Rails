require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    before :each do
      @user = User.new(first_name: "Alex", last_name: "Jeong", email: "asdf@gmail.com", password: "password", password_confirmation: "password")
    end
    
    it "should have a first_name validation error within the .errors.full_messages array when first_name is set to nil" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "should have a last_name validation error within the .errors.full_messages array when last_name is set to nil" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "should have a email validation error within the .errors.full_messages array when email is set to nil" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
  end
end
