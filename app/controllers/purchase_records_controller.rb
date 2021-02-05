class PurchaseRecordsController < ApplicationController
  def index
    @purchase_record_place = PurchaseRecordPlace.new
  end

end
