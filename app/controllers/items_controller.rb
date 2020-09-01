class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :name,  :description, :category_id, :condition_id, :charge_id, :shipping_place_id, :shipping_date_id, :price
    )
  end
end
