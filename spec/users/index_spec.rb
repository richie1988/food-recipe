require 'rails_helper'

RSpec.feature "User management", :type => :feature do
  scenario "Create a new user and display the user's name" do
    visit "/users/new"

    fill_in "Name", :with => "Test User"
    fill_in "Email", :with => "test@example.com"
    fill_in "Password", :with => "password"
    click_button "Create User"

    expect(page).to have_text("Test User")
  end
end