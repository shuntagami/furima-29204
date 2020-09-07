class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :order,             foreign_key: true
      t.string     :postal_code,      null: false
      t.integer    :shipping_place_id, null: false
      t.string     :city,              null: false
      t.string     :banti,             null: false
      t.string     :building_name,     null: false
      t.string     :phone_number,      null: false
      t.timestamps
    end
  end
end
