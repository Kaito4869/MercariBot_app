class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
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

  def show
    @item = Item.find_by(id: params[:id])
    @user = User.find_by(id: @item.user_id)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to items_path
    else
      render 'edit'
    end
  end

  def destroy
    if @item.destroy
      redirect_to items_path
    else
      render 'show'
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :university_name, :faculty, :department, :grade, :condition, :name, :explain, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
