require 'rails_helper'

describe "Feature: User management" do
  context "No user is present" do
    it "Displays a form for the creation of a new user" do
      visit "/"
      expect(page).to have_content "Username"
    end
  end
end
