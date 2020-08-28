require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全項目が埋まっていれば登録できる" do
      end
      it "passwordが6文字以上であれば登録できる" do
      end
      it "passwordが英数字混合であれば登録できる" do
      end
      it "lastnameが全角（漢字，ひらがな，カタカナ）であれば登録できる" do
      end
      it "firstnameが全角（漢字，ひらがな，カタカナ）であれば登録できる" do
      end
      it "lastname_kanaが全角（カタカナ）であれば登録できる" do
      end
      it "firstname_kanaが全角（カタカナ）であれば登録できる" do
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
      end
      it "emailが空では登録できない" do
      end
      it "重複したemailが存在する場合登録できない" do
      end
      it "emailに@が含まれない場合登録できない" do
      end
      it "lastnameが空では登録できない" do
      end
      it "firstnameが空では登録できない" do
      end
      it "lastname_kanaが空では登録できない" do
      end
      it "firstname_kanaが空では登録できない" do
      end
      it "birth_dateが空では登録できない" do
      end
      it "passwordが空では登録できない" do
      end
      it "passwordが5文字以下であれば登録できない" do
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
      end
      it "passwordがアルファベットのみでは登録できない" do
      end
      it "passwordが数字のみでは登録できない" do
      end
      it "passwordとpassword_confirmationが異なる" do
      end
      it "lastnameに全角でない文字が含まれる場合登録できない" do
      end
      it "firstnameに全角でない文字が含まれる場合登録できない" do
      end
      it "lastname_kanaにカタカナ以外の文字が含まれる場合登録できない" do
      end
      it "firstname_kanaにカタカナ以外の文字が含まれる場合登録できない" do
      end
    end
  end
end