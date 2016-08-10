require 'rails_helper'

RSpec.describe CartItem, type: :model do
  describe "CartItem 功能" do
    it "可以計算它自己的金額(小計)" do
      cart = Cart.new
      p1 = Product.create(title: "p1", price: 100)
      p2 = Product.create(title: "p2", price: 200)
      
      3.times { cart.add_item(p1.id) }
      4.times { cart.add_item(p2.id) }
      
      expect(cart.items.first.price).to be 300
      expect(cart.items.second.price).to be 800
      
    end
  end
end
