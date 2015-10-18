require 'rails_helper'

 def signup
    visit "/posts"
      click_link "SIGN IN"
      expect(page).to have_content("Log in")

      click_link "Sign up"
      fill_in "Email", with: "clair@example.co.uk"
      fill_in "Password", with: "aaaaaaaa"
      fill_in "Password confirmation", with: "aaaaaaaa"
    
      click_button "Sign up"
      expect(page).to have_link("Add new post")
 end



 describe "Creating posts" do
  it "Adds a new post" do
    signup
    click_link "Add new post"
    expect(page).to have_content("Add a new post")
    
    fill_in "Title", with: "My post"
    fill_in "Category", with: "Learning"
    click_button "Create Post"
    
    expect(page).to have_content("My post")
  end
   
   it "Doesn't save without a title" do
    signup
    click_link "Add new post"
    expect(page).to have_content("Add a new post")
    
    fill_in "Title", with: ""
    fill_in "Category", with: "Learning"
    click_button "Create Post"
    
    expect(Page.count).to eql(0)
    expect(page).to have_content("Error")
   end
end