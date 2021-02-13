class OrdersController < ApplicationController
  before_action :move_to_login, only: [:index]
  before_action :correct_user, only: [:index]
  before_action :find_item, only: [:index, :create]

  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      binding.pry
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:token, :postal_code, :prefecture, :city, :banti, :building_name, :phone_number)
    .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    item = Item.find(params[:item_id])
    order_price = Item.find(item.id).price
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def move_to_login
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def correct_user
    item = Item.find(params[:item_id])
    if (current_user.id == item.user_id) || item.order
      redirect_to root_url
    end
  end
end
