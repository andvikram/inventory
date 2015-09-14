class ItemsController < ApplicationController
  def index
  	@items = Item.limit(10)
  end

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.create!(item_params)
  	
  	redirect_to root_path
  end

  def destroy
  	item = Item.find(params[:id])
  	item.destroy

  	redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :quantity)
  end
end
