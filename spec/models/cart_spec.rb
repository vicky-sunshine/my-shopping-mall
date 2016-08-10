require 'rails_helper'

RSpec.describe Cart, type: :model do
  # 1. 可以新增商品到購物車裡，然後購物車裡就有東西了。
  # 2. 如果加了相同種類的商品到購物車裡，購買項目(CartItem)並不會增加，但數量會改變。
  # 3. 商品可以放到購物車裡，也可以再拿出來。
  # 4. 可以計算整台購物車的總消費金額。

  describe "購物車功能" do
    it "可以新增商品到購物車裡" do
      cart = Cart.new
      expect(cart).to be_empty
      
      cart.add_item(1)
      
      expect(cart).not_to be_empty
      expect(cart.items.count).to be 1
    end
     
    it "加了同類商品到購物車，購買項目(CartItem)不會增加，但數量會改變" do
    end
  end
end
