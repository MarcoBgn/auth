require 'rails_helper'
require 'user_management_helper.rb'

describe "Feature: User management" do
  context "No user is present" do
    it "Displays a form for the creation of a new user" do
      visit "/"
      expect(page).to have_content "Username"
      expect(page).to have_field "Username"
      expect(page).to have_content "Email"
      expect(page).to have_field "Email"
      expect(page).to have_content "Password"
      expect(page).to have_field "Password"
    end

    it "allows a user to Sign Up" do
      sign_up
      expect(page).to have_content "User successfully created"
    end

    it "Shows a notice if the user is not validated" do
      sign_up(email: nil)
      expect(page).not_to have_content "User successfully created"
      expect(page).to have_content "User could not be created"
    end
  end

  context "when a user is signed up" do
    it "it is automatically logged in" do
      sign_up
      expect(page).to have_content "Logged in as TestUser"
    end
  end
end
