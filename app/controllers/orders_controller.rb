class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

def index
  @item = Item.find(params[:item_id])
  @order_address = OrderAddress.new
end

def create
  @item = Item.find(params[:item_id])
  @order_address = OrderAddress.new(order_params)
  if @order_address.valid?
    @order_address.save
    redirect_to root_path
  else
    render :index, status: :unprocessable_entity
  end
end

private

def order_params
  params.require(:order_address).permit(:order_id, :postal_code, :region_id, :city, :street_address, :building_name, :phone_number).merge(user_id: current_user.id)
end

end