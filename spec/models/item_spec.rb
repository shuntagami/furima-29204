require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品がうまくいくとき' do
      it "全項目が埋まっていれば出品できる" do
      end
      it "imgがあれば出品できる" do
      end
      it "nameがあれば出品できる" do
      end
      it "descriptionがあれば出品できる" do
      end
      it "categoryが選択してあれば出品できる" do
      end
      it "conditionが選択してあれば出品できる" do
      end
      it "chargeが選択してあれば出品できる" do
      end
      it "shipping_placeが選択してあれば出品できる" do
      end
      it "shipping_dateが選択してあれば出品できる" do
      end
      it "priceが300以上9,999,999以下であれば出品できる" do
      end
    end

    context '出品がうまくいかないとき' do
      it "imageが選択されていないと出品できない" do
      end
      it "nameが空だと出品できない" do
      end
      it "descriptionmが空だと出品できない" do
      end
      it "categoryが選択されていないと出品できない" do
      end
      it "conditionが選択されていないと出品できない" do
      end
      it "chargeが選択されていないと出品できない" do
      end
      it "shipping_placeが選択されていないと出品できない" do
      end
      it "shipping_dateが選択されていないと出品できない" do
      end
      it "priceが空だと出品できない" do
      end
      it "priceに数字以外が含まれると出品できない" do
      end
      it "priceが300より小さいと出品できない" do
      end
      it "priceが9,999,999より大きいと出品できない" do
      end
    end
  end
end