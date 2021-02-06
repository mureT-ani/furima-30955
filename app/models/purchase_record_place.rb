class PurchaseRecordPlace
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_number, :area_id, :city, :house_number, :building_name, :phone_number,
                :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_number, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :area_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Place.create(postal_number: postal_number, area_id: area_id, city: city, house_number: house_number,
                 building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end
