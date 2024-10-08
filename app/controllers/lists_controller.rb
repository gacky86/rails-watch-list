class ListsController < ApplicationController
  # :index, :show, :new, :create
  def index
    @lists = List.all
    # raise
  end
  def show
    @list = List.find(params[:id])
    @movies = Movie.all
    @bookmarks = Bookmark.where(list_id: @list.id)
  end
  def new
    @list = List.new
  end
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
