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
    
    expect(Post.count).to eql(0)
     expect(page).to have_content("error")
   end
   
   it "Doesn't save without a category" do
    signup
    click_link "Add new post"
    expect(page).to have_content("Add a new post")
    
    fill_in "Title", with: "My post"
    fill_in "Category", with: ""
    click_button "Create Post"
    
    expect(Post.count).to eql(0)
     expect(page).to have_content("error")
   end
	 
	 it "Displays a new category in the side navigation" do
		signup
    click_link "Add new post"
    expect(page).to have_content("Add a new post")
    
    fill_in "Title", with: "My post"
    fill_in "Category", with: "Learning" 
    click_button "Create Post"
		 
		click_link "Back to blog"
    
		expect(page).to have_content("Learning")
		 # Doesn't actually check the sidebar, just that it is on the page. Could probably do it with a CSS selector...
	 end
	 
end