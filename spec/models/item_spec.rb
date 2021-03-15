require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品出品" do
    before do
      @item = FactoryBot.build(:item)
    end  
    context "商品出品ができる場合" do
      it "title,image,item_pr,category_id,item_status_id,shipping_fee_id,shipping_day_id,prefecture,priceがあれば出品できる" do
        expect(@item).to be_valid
      end
    end  
    context "データが保存されず商品出品ができない場合" do
      it "imageがないと保存されない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "titleがないと保存されない" do
        @item.title = " "
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")        
      end
      it "item_prがないと保存されない" do
        @item.item_pr = " "
        @item.valid?
        expect(@item.errors.full_messages).to include("Item pr can't be blank")
      end
      it "category_idがないと保存されない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "item_status_idがないと保存されない" do
        @item.item_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")  
      end
      it "shipping_fee_idがないと保存されない" do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it "prefecture_idがないと保存されない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "shipping_day_idがないと保存されない" do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it "priceがないと保存されない" do
        @item.price = " "
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300円未満だと保存されない" do
        @item.price = "299"
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが10000000円以上だと保存されない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")  
      end
      it "priceが全角数字だと保存されない" do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      
    end                         
  end  
end
