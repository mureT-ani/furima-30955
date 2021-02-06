class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create, :not_seller_check, :sold_check]
  before_action :not_seller_check
  before_action :sold_check


  def index
    @purchase_record_place = PurchaseRecordPlace.new
  end

  def create
    @purchase_record_place = PurchaseRecordPlace.new(purchase_params)
    if @purchase_record_place.valid?
      pay_item
      @purchase_record_place.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def not_seller_check
    redirect_to root_path if current_user.id == @item.user_id
  end

  def sold_check
    redirect_to root_path if PurchaseRecord.find_by(item_id: @item.id)
  end

  def purchase_params
    params.require(:purchase_record_place).permit(:postal_number, :area_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
