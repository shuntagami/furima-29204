class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :find_item, only: [:show, :edit, :update]
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

  def index
    @items = Item.all.order(id: 'DESC')
  end

  def show
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  def item_params
    params.require(:item).permit(
      :image, :name, :description, :category_id, :condition_id, :charge_id, :prefecture_id, :shipping_date_id, :price
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
