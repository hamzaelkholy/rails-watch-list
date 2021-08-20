class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    # Create new list getting params from private method
    @list = List.new(list_params)
    # Save the list instances
    @list.save
    # Redirect back to lists index page
    redirect_to list_path(@list)
  end
  private

  def list_params
     params.require(:list).permit(:name)
  end

end
