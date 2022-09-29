class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @items = Item.where("user_id = #{current_user.id}")
  end
  
end
