require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品' do
    context '出品がうまくいくとき' do
      it "全項目が埋まっていれば出品できる" do
        expect(@item).to be_valid
      end
      it "imgがあれば出品できる" do
        @item.image = fixture_file_upload('public/images/test_image.png')
        expect(@item).to be_valid
      end
      it "nameがあれば出品できる" do
        @item.name = "財布"
        expect(@item).to be_valid
      end
      it "descriptionがあれば出品できる" do
        @item.description = "不用品なので出品します"
        expect(@item).to be_valid
      end
      it "categoryが選択してあれば出品できる" do
        @item.category_id = 3
        expect(@item).to be_valid
      end
      it "conditionが選択してあれば出品できる" do
        @item.condition_id = 3
        expect(@item).to be_valid
      end
      it "chargeが選択してあれば出品できる" do
        @item.charge_id = 3
        expect(@item).to be_valid
      end
      it "prefectureが選択してあれば出品できる" do
        @item.prefecture_id = 3
        expect(@item).to be_valid
      end
      it "shipping_dateが選択してあれば出品できる" do
        @item.shipping_date_id = 3
        expect(@item).to be_valid
      end
      it "priceが300以上9,999,999以下であれば出品できる" do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it "imageが選択されていないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが空だと出品できない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "categoryが選択されていないと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "conditionが選択されていないと出品できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it "chargeが選択されていないと出品できない" do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge must be other than 1")
      end
      it "prefectureが選択されていないと出品できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "shipping_dateが選択されていないと出品できない" do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
      end
      it "priceが空だと出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceに数字以外が含まれると出品できない" do
        @item.price = "aaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが300より小さいと出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが9,999,999より大きいと出品できない" do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end