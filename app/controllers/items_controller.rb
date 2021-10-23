class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show, :new, :create]
  before_action :set_item, only: [:edit, :show]

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
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:goods_name, :goods_description, :price, :goods_category_id, :goods_status_id, :prefecture_id,
                                 :shipping_cost_id, :shipping_date_id, images: []).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in? && current_user.id == set_item.user_id && set_item.order.blank?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
