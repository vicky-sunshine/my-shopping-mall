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
    item_found = items.find { |item| item.product_id == product_id }
    
    if item_found
      # add quantity
      item_found.increment
    else
      # no, add a new item
      items << CartItem.new(product_id)
    end
  end
  
  def total_price
    total = items.reduce(0) { |sum, item| sum + item.price}
    
    if xmas?
      total *= 0.9
    end
    
    total
  end
  
  private
  
  def xmas?
    Time.now.day == 25 && Time.now.month ==12
  end
end