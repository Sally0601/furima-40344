class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :category_id, :condition_id, :delivery_charge_id,:region_id, :preparation_id, :description, :price)
  end
end
