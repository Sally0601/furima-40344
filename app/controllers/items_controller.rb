class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def show
    @item = Item.find(params[:id])
  end

  private

  def items_params
    params.require(:item).permit(:image, :name, :category_id, :condition_id, :delivery_charge_id,:region_id, :preparation_id, :description, :price).merge(user_id:current_user.id)
  end
end
