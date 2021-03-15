class Item < ApplicationRecord
  belongs_to :user
  has_one_attached  :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :shipping_fee
  belongs_to :item_status
  belongs_to :category


  with_options presence: true  do
    validates :title , :image ,:item_pr
    validates :price , format: { with: /\d[300-9999999]/ }
  end  
  
  with_options numericality: { other_than: 1 } do
    validates :item_status_id, :category_id, :prefecture_id, :shipping_day_id, :shipping_fee_id
  end  

 
end
