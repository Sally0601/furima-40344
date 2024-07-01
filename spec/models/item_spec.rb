require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user: @user)
    end

    context '商品出品ができる場合' do
      it '価格が半角数字のみであれば出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it '全ての項目が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない場合' do

      it 'userが紐付いていない場合は登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明が空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーが未選択（id:0）の場合は出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が未選択（id:0）の場合は出品できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担が未選択（id:0）の場合は出品できない' do
        @item.delivery_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it '発送元の地域が未選択（id:0）の場合は出品できない' do
        @item.region_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end

      it '発送までの日数が未選択（id:0）の場合は出品できない' do
        @item.preparation_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation can't be blank")
      end

      it '価格が空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = '300a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '価格が300未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格が9,999,999を超えると出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end