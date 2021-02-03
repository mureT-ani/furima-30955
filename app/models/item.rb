class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :days
  belongs_to :fee
  belongs_to :status
  belongs_to :user
  has_one_attached :image

end
