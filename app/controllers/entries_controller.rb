class EntriesController < ApplicationController
  
  before_action :find_entry, only:[:show, :edit, :update, :delete]
  
  def index
    @all_entries = Entry.all
    if params[:letter]
      @entries = Entry.select{|entry| entry.title.first == params[:letter]}.paginate(page: params[:page], :per_page => 2)
    else
      @entries = Entry.all.order(created_at: :desc).paginate(page: params[:page], :per_page => 5)
    end
  end
  
  def new 
    @entry = Entry.new
  end
  
  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to entry_path(@entry)
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    @entry.update(entry_params)
    if @entry.save
      redirect_to entry_path(@entry)
    else
      render 'edit'
    end
  end
  
  def show
  end
  
  def destroy
    if @entry.destroy
      redirect_to entries_path
    end
  end
  
private
  
  def entry_params
    params.require(:entry).permit(:title, :description)
  end
  
  def find_entry
    @entry = Entry.find_by_slug(params[:id])
  end
  
end
