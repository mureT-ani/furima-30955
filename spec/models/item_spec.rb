require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品できる場合' do
      it '全ての必須項目を満たしていれば出品できること' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it '商品画像をつけないと出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がないと出品できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明がないと出品できないこと' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリーで---(id:1)を選択すると出品できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'カテゴリーが空白だと出品できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態で---(id:1)を選択すると出品できないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end

      it '商品の状態が空白だと出品できないこと' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it '配送料の負担で---(id:1)を選択すると出品できないこと' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee must be other than 1')
      end

      it '配送料の負担が空白だと出品できないこと' do
        @item.fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end

      it '発送元の地域で---(id:1)を選択すると出品できないこと' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 1')
      end

      it '発送元の地域が空白だと出品できないこと' do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end

      it '発送までの日数で---(id:1)を選択すると出品できないこと' do
        @item.days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days must be other than 1')
      end

      it '発送までの日数が空白だと出品できないこと' do
        @item.days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end

      it '価格がないと出品できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が￥300未満だと出品できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end

      it '価格が￥10,000,000以上だと出品できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end

      it '価格が半角数字でないと出品できないこと' do
        @item.price = '一万円'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
