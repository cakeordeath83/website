class TagsController < ApplicationController
	
	add_breadcrumb "LEARNING GUIDES", :snippets_path
	
	def show
		
		@tag = Tag.find(params[:id])
		add_breadcrumb "#{@tag.name.upcase}"
	end
end
