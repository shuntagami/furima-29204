require 'rails_helper'

describe OrderAddress do
  before do
    @order_address = FactoryBot.build(:order_address)
  end
  describe '商品購入' do
    context '購入がうまくいくとき' do
      it "全て正しく入力されていれば購入可能" do
      end
      it "カード番号が入力されていれば購入可能" do
      end
      it "カードの有効期限が切れていなければ購入可能" do
      end
      it "cvcが正しく入力されていれば購入可能" do
      end
      it "郵便番号がハイフン込みで入力されていれば購入可能" do
      end
      it "都道府県が選択されていれば購入可能" do
      end
      it "市町村区が入力されていれば購入可能" do
      end
      it "電話番号がハイフンなしの数字のみで入力されていれば購入可能" do
      end
    end

    context '購入がうまくいかないとき' do
      it "カード番号が空だと購入できない" do
      end
      it "カード番号が正しくないと購入できない" do
      end
      it "cvcが空だと購入できない" do
      end
      it "cvcが正しくないと購入できない" do
      end
      it "カードの有効期限が空だと購入できない" do
      end
      it "カードの有効期限が切れていると購入できない" do
      end
      it "郵便番号が空だと購入できない" do
      end
      it "郵便番号にハイフンが含まれていないと購入できない" do
      end
      it "都道府県が選択されていないと購入できない" do
      end
      it "市町村区が空だと購入できない" do
      end
      it "電話番号が空だと購入できない" do
      end
      it "電話番号にハイフンが含まれていると購入できない" do
      end
    end
  end
end
