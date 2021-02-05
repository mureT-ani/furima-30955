require 'rails_helper'

RSpec.describe PurchaseRecordPlace, type: :model do
  describe '商品購入' do
    before do
      @purchase_record_place = FactoryBot.build(:purchase_record_place)
    end

    context '購入できる場合' do
      it '全ての必須項目を満たしていれば購入できること' do
        expect(@purchase_record_place).to be_valid
      end

      it '建物名がなくても購入できること' do
        @purchase_record_place.building_name = nil
        expect(@purchase_record_place).to be_valid
      end

    end

    context '購入できない場合' do
      it '郵便番号がないと購入できないこと' do
        @purchase_record_place.postal_number = nil
        @purchase_record_place.valid?
        expect(@purchase_record_place.errors.full_messages).to include ("Postal number can't be blank" )
      end

      it '郵便番号にハイフンがないと購入できないこと' do
        @purchase_record_place.postal_number = '1234567'
        @purchase_record_place.valid?
        expect(@purchase_record_place.errors.full_messages).to include ("Postal number is invalid")
      end

      it '郵便番号にが7桁でないと購入できないこと' do
        @purchase_record_place.postal_number = '123-45678'
        @purchase_record_place.valid?
        expect(@purchase_record_place.errors.full_messages).to include ('Postal number is invalid')
      end

      it '都道府県で---(id:1)を選択すると購入できないこと' do
        @purchase_record_place.area_id = 1
        @purchase_record_place.valid?
        expect(@purchase_record_place.errors.full_messages).to include('Area must be other than 1')
      end

      it '都道府県が空白だと出品できないこと' do
        @purchase_record_place.area_id = nil
        @purchase_record_place.valid?
        expect(@purchase_record_place.errors.full_messages).to include("Area can't be blank")
      end

      it '市区町村がないと購入できないこと' do
        @purchase_record_place.city = nil
        @purchase_record_place.valid?
        expect(@purchase_record_place.errors.full_messages).to include ("City can't be blank" )
      end

      it '番地がないと購入できないこと' do
        @purchase_record_place.house_number = nil
        @purchase_record_place.valid?
        expect(@purchase_record_place.errors.full_messages).to include ("House number can't be blank" )
      end

      it '電話番号がないと購入できないこと' do
        @purchase_record_place.phone_number = nil
        @purchase_record_place.valid?
        expect(@purchase_record_place.errors.full_messages).to include ("Phone number can't be blank" )
      end

      it '電話番号にハイフンがあると購入できないこと' do
        @purchase_record_place.phone_number = '090-1234-5678'
        @purchase_record_place.valid?
        expect(@purchase_record_place.errors.full_messages).to include ('Phone number is invalid')
      end

      it '電話番号が10桁か11桁でないと購入できないこと' do
        @purchase_record_place.phone_number = '09012345'
        @purchase_record_place.valid?
        expect(@purchase_record_place.errors.full_messages).to include ('Phone number is invalid' )
      end

    end

  end
end
