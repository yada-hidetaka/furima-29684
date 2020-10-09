class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index 
    @items = Item.order("create_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :prefecture_id, :text, :category_id, :ship_form_id, :status_id, :day_id, :price).merge(user_id: current_user.id)
  end
end
