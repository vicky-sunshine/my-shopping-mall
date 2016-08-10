class Cart
  attr_reader :items
  
  def initialize
    @items = []
  end

  def empty?
    items.empty? 
    # items is a function, which call for @items
  end

  def add_item(product_id)
    items << product_id
  end
end