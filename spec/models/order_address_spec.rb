require 'rails_helper'

describe OrderAddress do
  before do
    @order_address = FactoryBot.build(:order_address)
  end
  it "全て正しく入力されていれば購入可能" do
     expect(@order_address).to be_valid
  end
  it "建物名が空でも購入可能" do
    @order_address.building_name = nil
    expect(@order_address).to be_valid
  end
  it "カード番号が空だと購入できない" do
    @order_address.token = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Token can't be blank")
  end
  it "郵便番号が空だと購入できない" do
    @order_address.postal_code = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
  end
  it "郵便番号にハイフンが含まれていないと購入できない" do
    @order_address.postal_code = Faker::Address.postcode.delete("-")
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
  end
  it "都道府県が選択されていないと購入できない" do
    @order_address.prefecture = 1
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
  end
  it "市町村区が空だと購入できない" do
    @order_address.city = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("City can't be blank")
  end
  it "電話番号が空だと購入できない" do
    @order_address.phone_number = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
  end
  it "電話番号にハイフンが含まれていると購入できない" do
    @order_address.phone_number = Faker::PhoneNumber.cell_phone
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number is invalid. You can't use hyphen(-)")
  end
end
