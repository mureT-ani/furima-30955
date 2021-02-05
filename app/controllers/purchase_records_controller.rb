class PurchaseRecordsController < ApplicationController
  def index
    @purchase_record_place = PurchaseRecordPlace.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_record_place = PurchaseRecordPlace.new(purchase_params)
    if @purchase_record_place.valid?
      @purchase_record_place.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_record_place).permit(:postal_number, :area_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

end
