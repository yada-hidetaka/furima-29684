class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_set, only: [:index, :create]

  def index
    @order = ItemOrder.new
    if @item.user.id == current_user.id
      redirect_to root_path
    else
      render 'index'
    end
  end

  def create
    @order = ItemOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city, :phone, :block, :build, :order_id).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def item_set
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.order.present?
  end
end