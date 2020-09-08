class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_place, :city, :banti, :building_name, :phone_number
end