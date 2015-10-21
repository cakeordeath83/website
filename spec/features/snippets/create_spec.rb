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



describe "Creating snippets" do
	 it "Adds a new snippet" do
    signup
		click_link "GUIDES"
		click_link "Add new snippet"
		 expect(page).to have_content("Add a new code snippet")

		fill_in "Title", with: "My snippet"
    fill_in "Category", with: "Learning" 
		 click_button "Create Snippet"
    
		 expect(page).to have_content("My snippet")
  end


   it "Doesn't save without a title" do
    signup
		click_link "GUIDES"
		click_link "Add new snippet"
		 expect(page).to have_content("Add a new code snippet")
    
    fill_in "Title", with: ""
    fill_in "Category", with: "Learning"
		 click_button "Create Snippet"
    
		 expect(Snippet.count).to eql(0)
     expect(page).to have_content("error")
   end



   it "Doesn't save without a category" do
    signup
		click_link "GUIDES"
		click_link "Add new snippet"
		 expect(page).to have_content("Add a new code snippet")
    
		 fill_in "Title", with: "My snippet"
    fill_in "Category", with: ""
		 click_button "Create Snippet"
    
		 expect(Snippet.count).to eql(0)
     expect(page).to have_content("error")
   end
	
	it "Displays a new category in the side navigation" do
		 
		signup
		click_link "GUIDES"
		click_link "Add new snippet"
		expect(page).to have_content("Add a new code snippet")
    
		fill_in "Title", with: "My snippet"
    fill_in "Category", with: "Learning" 
    click_button "Create Snippet"
		 
		click_link "Back to guides"
    
		expect(page).to have_content("Learning")
	end
end
