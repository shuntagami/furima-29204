class Address < ApplicationRecord
  belongs_to :order
  belongs_to_active_hash :shipping_place
end
