require "rails_helper"

RSpec.describe OrderAddress, type: :model do
  describe "購入者情報の保存" do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end
    context "情報を保存できるとき" do
      it "全ての値が正常に入力されていれば保存できる" do
        expect(@order_address).to be_valid
      end
      it "buildingが空でも保存できる" do
        @order_address.building = " "
        expect(@order_address).to be_valid
      end
    end  
    context "情報を保存できないとき" do
      it "postal_codeが空では保存できない" do
        @order_address.postal_code = " "
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeが半角ハイフンを含んでおらず保存されない" do
        @order_address.postal_code = "1234556"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
      it "postal_codeが数値以外では保存できない" do
        @order_address.postal_code = "yeahhhh"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end  
      it "prefecture_idが空では保存できない" do
        @order_address.prefecture_id = " "
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cityが空では保存できない" do
        @order_address.city = " "
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it "house_numberが空では保存できない" do
        @order_address.house_number = " "
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it "phone_numberが空では保存できない" do
        @order_address.phone_number = " "
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが12桁以上では保存できない" do
        @order_address.phone_number = "123456789876"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberが数値以外では保存できない" do
        @order_address.phone_number = "oihwbjijsas"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では保存できない" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end

end