require 'rails_helper'

# Methods for logging in
  def create_user!
    @user = User.create(email: 'clair@example.co.uk', password: 'aaaaaaaa')
  end

 def log_in
	visit "/posts"
	click_link "SIGN IN"
  expect(page).to have_content("Log in")

  fill_in "Email", with: "clair@example.co.uk"
  fill_in "Password", with: "aaaaaaaa"
	 click_button "Log in"
 end



# Start of tests
# PROBLEM! Can't test upload of files. Capybara is trying to create a folder to save my image in, but Nitrous doesn't seem to want to let me
# CODEBAR

describe "Login" do
	before(:each) do
		create_user!
		log_in
	end
	
	describe "Edit posts" do
		
		let!(:post){Post.create(title: "My new post", category: "Questions")}
		
		# Method to create a post (must stay within the describe block)
		def edit_post(options={})
			options[:title] ||= "My updated post"
			options[:category] ||= "Update"

			visit '/'
				within "#post_#{post.id}" do
				click_link "Edit"
				end
			
			fill_in "Title", with: options[:title]
			fill_in "Category", with: options[:category]
			click_button "Update Post"
		end
		
		it "Saves a post on success" do
			edit_post
			expect(page).to have_content("My updated post")
	  end

		it "Displays the correct slug" do
			edit_post
			expect(title).to have_content "Coding with Clair | My updated post"
		end

		it "Displays the sharing icons" do
			edit_post
			expect(page).to have_content("Tweet")
		end

		it "Shows the new post on the post index page" do
			edit_post
			click_link("Back to blog")
			expect(page).to have_content("My updated post")
		end
		
	end
end
	 