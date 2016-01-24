class TopicsController < ApplicationController
	
	before_action :find_topic, only: [:show, :edit, :update, :destroy]
	
	add_breadcrumb "LEARNING GUIDES", :entries_path
	
	def show
		add_breadcrumb "#{@topic.name.upcase}"
		@title = @topic.name
	end
	
	def new
	end
	
	def index
		@topics = Topic.all.order(created_at: :desc)
	end
	
	def edit
	end
	
	def update
		if @topic.update(topic_params)
			redirect_to topics_path
		else
			render :edit
		end
	end
	
	def destroy
		@topic.destroy
		redirect_to topics_path
	end
	
	private
	
	def topic_params
		params.require(:topic).permit(:name, :category)
	end
	
	def find_topic
		@topic = Topic.find(params[:id])
	end
	
end
