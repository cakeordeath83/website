require 'rails_helper'

# Need to create a tag otherwise there is an error in the side navigation as it can't call upcase on nil
# However, doesn't seem to be working...
# CODEBAR!

=begin
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


def create_tag
	@tag = Tag.create(name: "Tagtest", category: "Categorytest")
end



# Start of tests


describe "Login" do
	before(:each) do
		
		create_user!
		log_in
		create_tag
		
	end
	
	
	
	describe "Create snippets" do
		
		# Method to create a post (must stay within the describe block)
		def create_snippet(options={})
			options[:title] ||= "My new snippet"
			options[:tag] ||= "Tag1"

			visit '/snippets'
			click_link "Add new snippet"
			fill_in "Title", with: options[:title]
			fill_in "Tag list", with: options[:tag]
			click_button "Create Snippet"
		end
		
		
		it "Saves a snippet on success" do
			create_snippet
			expect(Snippet.count).to eql(1)
	  end

		it "Does not save without title" do
			create_snippet(title: "")
			expect(page).to have_content("error")
	  end
		
		#it "Does not save without tags" do
		#	create_snippet(tag: "")
			#expect(Snippet.count).to eql(0)
	 # end


	end
end
=end
