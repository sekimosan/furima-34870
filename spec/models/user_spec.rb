require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "新規ユーザー登録" do
    context "ユーザー登録ができる場合" do
      it "nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birthdayがあれば登録できる" do
        expect(@user).to be_valid
      end 
    end
    context "新規登録ができない場合" do     
      it "nicknameが空では登録できない" do
        @user.nickname = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが重複していると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailは@を含まないと登録できない" do
        @user.email = "abcdefg.gmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが５文字以下では登録できない" do
        @user.password = "1asdr"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英数字混合でないと登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationの値が一致しないと登録できない" do
        @user.password = "a1a1a1a1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "ユーザー名はlast_nameとfirst_nameがないと登録できない" do
        @user.last_name = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "ユーザー名は全角漢字ひらがなカタカナ以外では登録できない" do
        @user.first_name = "hanako"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "ユーザー名はlast_name_kanaとfirst_name_kanaがないと登録できない" do
        @user.last_name_kana = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "ユーザー名のlast_name_kanaとfirst_name_kanaは全角カタカナでないと登録できない" do
        @user.last_name_kana = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "birthdayがないと登録できない" do
        @user.birthday = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end  
    end  
  end                        
end
