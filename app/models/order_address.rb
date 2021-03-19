class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:postal_code,:prefecture_id,:city,:house_number,:building,:phone_number

  with_options presence: true do
    validates :user_id,:item_id,:prefecture_id,:city,:house_number
    validates :postal_code,format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :phone_number, format: {with: /\A[0-9]{,11}\z/}
  end

  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end

end