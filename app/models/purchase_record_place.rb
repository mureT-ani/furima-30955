class PurchaseRecordPlace
  include ActiveModel::ActiveModel
  attr_accessor :postal_number, :prefecture_id, :city, :house_number, :building_number, :phone_number

  with_options presence: true do
    validates :postal_number, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    item = Item.find(params[:id])
    purchase_record = PurchaseRecord.create(user_id: current_user.id, item_id: item.id)
    Place.create(postal_number: postal_number, prefecture_id: prefecture_id, city: city, house_number: house_number, building_number: building_number, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end

end