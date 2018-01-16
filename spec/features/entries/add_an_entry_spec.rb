require 'rails_helper'

def log_in_as(user)
  visit new_user_session_path
  fill_in("user_email", :with => user.email)
  fill_in("user_password", :with => user.password)
end



describe "adding an entry" do
  it "allows a logged in user to create an entry" do
    user = User.create(email: "clair@example.com", password: "aaaaaaaa")
    log_in_as(user)
    visit new_entry_path
    fill_in "Title", with: "RSpec"
    fill_in "Topic list", with: "Rails"
    click_on("Create Entry")
    visit entries_path
    expect(page).to have_content("RSpec")
  end
end