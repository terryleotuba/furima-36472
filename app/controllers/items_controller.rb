class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
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
    params.require(:item).permit(:goods_name, :goods_description, :price, :goods_category_id, :goods_status_id, :prefecture_id, :shipping_cost_id, :shipping_date_id, :image).merge(user_id: current_user.id)
  end

end
