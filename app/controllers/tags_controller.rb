class TagsController < ApplicationController
	
	before_action :find_tag, only: [:show, :edit, :update]
	
	add_breadcrumb "LEARNING GUIDES", :snippets_path
	
	def show
		add_breadcrumb "#{@tag.name.upcase}"
	end
	
	def new
	end
	
	def index
		@tags = Tag.all.order(created_at: :desc)
	end
	
	def edit
	end
	
	def update
		if @tag.update(tag_params)
			redirect_to tags_path
		else
			render :edit
		end
	end
	
	private
	
	def tag_params
		params.require(:tag).permit(:name, :category)
	end
	
	def find_tag
		@tag = Tag.find(params[:id])
	end
	
end
