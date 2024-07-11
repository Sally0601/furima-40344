class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [:index, :create]
  before_action :set_user, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params.merge(user_id: @user.id, item_id: @item.id))
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_user
    @user = current_user
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :region_id, :city, :street_address, :building_name,
                                          :phone_number).merge(token: params[:token])
  end

  def pay_item
    @order_address.price = @item.price
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @order_address.price,
      card: @order_address.token,
      currency: 'jpy'
    )
  end
end
