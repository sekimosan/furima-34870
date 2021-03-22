class Item < ApplicationRecord
  belongs_to :user
  has_one_attached  :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :shipping_fee
  belongs_to :item_status
  belongs_to :category


  with_options presence: true  do
    validates :title , :image ,:item_pr, :category_id, :item_status_id, :shipping_fee_id, :shipping_day_id, :prefecture_id
  end  
  validates :price ,{presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}}

 
end
