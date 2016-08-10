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
      cart = Cart.new
      
      3.times {cart.add_item(1)}
      4.times {cart.add_item(2)}
      2.times {cart.add_item(1)}
      10.times {cart.add_item(2)}
      
      expect(cart.items.count).to be 2
      expect(cart.items.first.quantity).to be 5
      expect(cart.items.second.quantity).to be 14
      
    end
    
    it "商品可以放到購物車，也可以再拿出來" do
      cart = Cart.new
      p1 = Product.create(title: "p1", price: 100)
      cart.add_item(p1.id)
      
      expect(cart.items.first.product).to be_a Product
      expect(cart.items.first.product_id).to be p1.id
    end
    
    it "可以計算整台購物車的總消費金額" do
      cart = Cart.new
      p1 = Product.create(title: "p1", price: 100)
      p2 = Product.create(title: "p2", price: 200)
      3.times { cart.add_item(p1.id) }
      4.times { cart.add_item(p2.id) }

      expect(cart.total_price).to be 1100
    end
  end
end
