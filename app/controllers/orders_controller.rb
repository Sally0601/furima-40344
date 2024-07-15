class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    if current_user == @item.user || @item.order.present?
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      @order_address = OrderAddress.new
    end
  end

  def create
    @order_address = OrderAddress.new(order_params.merge(user_id: current_user.id, item_id: @item.id))
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :region_id, :city, :street_address, :building_name,
                                          :phone_number).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
