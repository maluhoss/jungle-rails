require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is valid with an email, password, password_confirmation, first_name and last_name" do
      user = User.create({
        email: "test@test.com",
        password: "testingtime",
        password_confirmation: "testingtime",
        first_name: "malu",
        last_name: "hoss"
      })
      expect(user).to be_valid
    end

    it "is not valid without an email" do
      user = User.create({
        email: nil,
        password: "testingtime",
        password_confirmation: "testingtime",
        first_name: "malu",
        last_name: "hoss"
      })
      expect(user).to_not be_valid
    end

    it "is not valid without a password and password_confirmation" do
      user = User.create({
        email: "test@test.com",
        password: nil,
        password_confirmation: nil,
        first_name: "malu",
        last_name: "hoss"
      })
      expect(user).to_not be_valid
    end

    it "is not valid without password matching password confirmation" do
      user = User.create({
        email: "test@test.com",
        password: "testingtime",
        password_confirmation: "testing",
        first_name: "malu",
        last_name: "hoss"
      })
      expect(user.password).to_not eq(user.password_confirmation)
    end

    it "is not valid without a first_name and last_name" do
      user = User.create({
        email: "test@test.com",
        password: "testingtime",
        password_confirmation: "testingtime",
        first_name: nil,
        last_name: nil
      })
      expect(user).to_not be_valid
    end

    it "requires emails to be unique and not case sensitive" do
      user = User.create({
        email: "test@test.com",
        password: "testingtime",
        password_confirmation: "testingtime",
        first_name: "malu",
        last_name: "hoss"
      })

      another_user = User.create({
        email: "test@test.com",
        password: "testingtime",
        password_confirmation: "testingtime",
        first_name: "malu",
        last_name: "hoss"
      })

      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "requires a password greater than 8 characters" do
      user = User.create({
        email: "test@test.com",
        password: "testingtime",
        password_confirmation: "testingtime",
        first_name: "malu",
        last_name: "hoss"
      })
      expect(user.password.length).to be >= 8
    end
  end

  describe '.authenticate_with_credentials' do
    it "will authenticate user credentials " do
      user = User.create({
        email: "test@test.com",
        password: "testingtime",
        password_confirmation: "testingtime",
        first_name: "malu",
        last_name: "hoss"
      })

      user_auth = User.authenticate_with_credentials(user.email, user.password)

      expect(user_auth).to eq(user)
    end

    it "will not authenticate user credentials if wrong email or password given" do
      user = User.create({
        email: "test@test.com",
        password: "testingtime",
        password_confirmation: "testingtime",
        first_name: "malu",
        last_name: "hoss"
      })

      user_auth = User.authenticate_with_credentials(user.email, "heythere")

      expect(user_auth).to be_nil
    end
  end

end
