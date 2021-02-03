class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :days
  belongs_to :fee
  belongs_to :status
  belongs_to :user
  has_one_attached :image

  
  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price, numericality: { greater_than: 299, less_than: 10000000}, format: { with: /\A[0-9]+\z/ }
    validates :user_id
    with_options numericality: { other_than: 1 } do
      validates :area_id
      validates :category_id
      validates :days_id
      validates :fee_id
      validates :status_id
    end
  end
end
