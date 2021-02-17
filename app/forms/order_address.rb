class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :order_id, :postal_code, :prefecture, :city, :banti, :building_name, :phone_number, :token

  with_options presence: true do
    validates :city, :banti, :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: "is invalid. You can't use hyphen(-)" }
    validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_code: postal_code, prefecture: prefecture, city: city, banti: banti, building_name: building_name,
                   phone_number: phone_number)
  end
end
