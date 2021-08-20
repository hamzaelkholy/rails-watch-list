class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    # Create new list getting params from private method
    @bookmark = Bookmark.new(bookmark_params)
    # Save the bookmark instances
    @bookmark.list = @list
    @bookmark.save
    # Redirect back to lists index page
    redirect_to list_path(@list)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    @bookmark.destroy

    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment, :id)
  end

end
