class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show, :new, :create]
  def index
    @items = Item.all.order('created_at DESC')
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:goods_name, :goods_description, :price, :goods_category_id, :goods_status_id, :prefecture_id,
                                 :shipping_cost_id, :shipping_date_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    item = Item.find(params[:id])
    # 商品が売れている条件を商品購入機能実装後に追加する予定
    unless user_signed_in? && current_user.id == item.user_id
      redirect_to action: :index
    end
  end

end
