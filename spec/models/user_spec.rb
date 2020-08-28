require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全項目が埋まっていれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "12345six"
        @user.password_confirmation = "12345six"
        expect(@user).to be_valid
      end
      it "passwordが英数字混合であれば登録できる" do
        @user.password = "12345six"
        @user.password_confirmation = "12345six"
        expect(@user).to be_valid
      end
      it "lastnameが全角（漢字，ひらがな，カタカナ）であれば登録できる" do
        @user.lastname = "佐藤"
        expect(@user).to be_valid
      end
      it "firstnameが全角（漢字，ひらがな，カタカナ）であれば登録できる" do
        @user.firstname = "太郎"
        expect(@user).to be_valid
      end
      it "lastname_kanaが全角（カタカナ）であれば登録できる" do
        @user.lastname_kana = "サトウ"
        expect(@user).to be_valid
      end
      it "firstname_kanaが全角（カタカナ）であれば登録できる" do
        @user.firstname_kana = "タロウ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@が含まれない場合登録できない" do
      end
      it "lastnameが空では登録できない" do
        @user.lastname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it "firstnameが空では登録できない" do
        @user.firstname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it "lastname_kanaが空では登録できない" do
        @user.lastname_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
      end
      it "firstname_kanaが空では登録できない" do
        @user.firstname_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end
      it "birth_dateが空では登録できない" do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "ab345"
        @user.password_confirmation = "ab345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordがアルファベットのみでは登録できない" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordが数字のみでは登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordとpassword_confirmationが異なる場合登録できない" do
        @user.password = "123abc"
        @user.password_confirmation = "abc123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "lastnameに全角でない文字が含まれる場合登録できない" do
        @user.lastname = "jordan"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname Full-width characters")
      end
      it "firstnameに全角でない文字が含まれる場合登録できない" do
        @user.firstname = "michael"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname Full-width characters")
      end
      it "lastname_kanaにカタカナ以外の文字が含まれる場合登録できない" do
        @user.lastname_kana = "じょーだん"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana Full-width katakana characters")
      end
      it "firstname_kanaにカタカナ以外の文字が含まれる場合登録できない" do
        @user.firstname_kana = "まいける"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana Full-width katakana characters")
      end
    end
  end
end