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

    it "should have a email presence validation error within the .errors.full_messages array when email is set to nil" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "should have a email uniqueness validation error within the .errors.full_messages array when registering with an email already in database (case insensitive)" do
      @user2 = User.new(first_name: "Obiwan", last_name: "Kenobi", email: "ASDF@gmail.com", password: "password", password_confirmation: "password")
      @user2.save!
      @user.valid?
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end

    it "should have a password presence validation error within the .errors.full_messages array when password set to nil" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "should have a password_confirmation presence validation error within the .errors.full_messages array when password_confirmation set to nil" do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "should have a password confirmation validation error within the .errors.full_messages array when password doesn't match password_confirmation" do
      @user.password_confirmation = "pasword"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "should have a password length validation error within the .errors.full_messages array when password doesn't meet minimum length requirement of 8" do
      @user.password = "pw"
      @user.password_confirmation = "pw"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end
  end

  describe ".authenticate_with_credentials" do
    before :each do
      @user = User.new(first_name: "Alex", last_name: "Jeong", email: "Asdf@gmail.Com", password: "password", password_confirmation: "password")
    end

    it "should return nil if authentication fails" do
      @user.save!
      @login_user = User.authenticate_with_credentials('asdf@gmail.com', 'pw')
      expect(@login_user).to be(nil)
    end

    it "should return an instance of the user if successfully authenticated" do
      @user.save!
      @login_user = User.authenticate_with_credentials('asdf@gmail.com', 'password')
      expect(@login_user).to eq(@user)
    end

    it "should return an instance of the user if successfully authenticated even if email has trailing spaces" do
      @user.save!
      @login_user = User.authenticate_with_credentials('  asdf@gmail.com ', 'password')
      expect(@login_user).to eq(@user)
    end

    it "should return an instance of the user if successfully authenticated even if the email is typed in the wrong case" do
      @user.save!
      @login_user = User.authenticate_with_credentials('  ASdF@gMail.com ', 'password')
      expect(@login_user).to eq(@user)
    end
  end
end
