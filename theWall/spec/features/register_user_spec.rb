require 'rails_helper'
feature "guest user creates an account" do
    scenario "successfully creates a new user account" do
        visit "/users/new"
        fill_in "user_username", with: "billybobbie"
        click_button "Create User"
        expect(page).to have_content "User successfully created"
    end
end