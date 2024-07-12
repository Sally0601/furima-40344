require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '出品商品の新規登録' do
    context '新規登録できるとき' do
      it 'すべての値が存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingが空でも登録できる' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '新規登録ができないとき' do
      it 'user_idが空では登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では登録できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'region_idが空では登録できない' do
        @order_address.region_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Region can't be blank")
      end
      it 'cityが空では登録できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空では登録できない' do
        @order_address.street_address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'postal_codeが3桁ハイフン4桁でないと登録できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'postal_codeが半角文字列でないと登録できない' do
        @order_address.postal_code = '１２３－４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'region_idが---では登録できない' do
        @order_address.region_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Region can't be blank")
      end
      it 'phone_numberが10桁以上でないと登録できない' do
        @order_address.phone_number = '100000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
      end
      it 'phone_numberが11桁以内でないと登録できない' do
        @order_address.phone_number = '100000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'phone_numberが半角数値でないと登録できない' do
        @order_address.phone_number = '００００００００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input half-width numbers.')
      end
    end
  end
end
