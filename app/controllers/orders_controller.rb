class OrdersController < ApplicationController
  before_action :move_to_login, only: [:index]
  before_action :correct_user, only: [:index]
  def index
    @item = Item.find(params[:item_id])
    # @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def move_to_login
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def correct_user
    if current_user.id == Item.find(params[:item_id]).user_id
      redirect_to root_url
    end
  end
end
