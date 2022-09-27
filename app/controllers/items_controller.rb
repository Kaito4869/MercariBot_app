class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render 'new'
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :university_name, :faculty, :department, :grade, :condition, :name, :explain, :price)
  end
end
