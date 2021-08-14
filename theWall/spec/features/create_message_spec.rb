require 'rails_helper'

feature "guest user creates a message" do
    before(:each) do
        @user = create(:user)
        visit "/users/new"
        fill_in "user_username", with: "billybobbie"
        click_button "Create User"
    end
    scenario "successfully creates a new message and can see message" do
        visit "/message/new"
        fill_in "message_message", with: "I do not like TDD is very confusing"
        click_button "Post Message"
        expect(page).to have_content "Message successfully created"
        expect(page).to have_content "I do not like TDD is very confusing"
    end

    scenario "unsuccessfully creates a new message and stays on same page with error" do
        visit "/message/new"
        fill_in "message_message", with: "I do"
        click_button "Post Message"
        expect(current_path).to eq(message_new_path)
        expect(page).to have_content "Message not created"
    end

    scenario "successfully logs out" do
        visit "/message/new"
        click_on 'Log Out'
        expect(current_path).to eq(users_new_path)
    end

end