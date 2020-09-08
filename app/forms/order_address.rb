class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_place, :city, :banti, :building_name, :phone_number
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /^[0-9]+$/, message: "is invalid. You can't use hyphen(-)."}
    validates :postal_code, :city, :banti
  end

  def save
    Order.create(user_id: user.id, item_id: item.id)

    Address.create(postal_code: postal_code, :shipping_place: :shipping_place, city: city, banti: banti, building_name: building_name,
                   phone_number: phone_number order_id: order.id)
  end
end
