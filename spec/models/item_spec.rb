require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品できる場合' do
    context '新規登録できるとき' do
      it '各情報が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it '商品名が空では出品できない' do
        @item.goods_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Goods name can't be blank")
      end
      it '商品名が40文字を超えると出品できない' do
        @item.goods_name = 'a'*41
        @item.valid?
        expect(@item.errors.full_messages).to include("Goods name is too long (maximum is 40 characters)")
      end
      it '商品の説明が空では出品できない' do
        @item.goods_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Goods description can't be blank")
      end
      it '商品の説明が1000文字を超えると出品できない' do
        @item.goods_description = 'a'*1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Goods description is too long (maximum is 1000 characters)")
      end
      it 'カテゴリーが空では出品できない' do
        @item.goods_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Goods category can't be blank")
      end
      it '商品の状態が空では出品できない' do
        @item.goods_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Goods status can't be blank")
      end
      it '配送料の負担が空では出品できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end
      it '発送元の地域が空では出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が空では出品できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it '商品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '販売価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が300未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it '販売価格が9,999,999を超えると出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it '販売価格が数値ではない場合出品できない' do
        @item.price = 'test'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it '販売価格の数値が全角の場合出品できない' do
        @item.price = '３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
