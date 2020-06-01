def find_item_by_name_in_collection(name, collection)
  collection.each do |item_hash|
    item_hash.each do |item_key, value|
      if value == name
        return item_hash
      end
    end
  end
  nil
end

def consolidate_cart(cart)
  cart_consolidated = {}
  cart.each do |item_hash|
    item_hash.each do |item_key, value|
      if cart_consolidated[:item] == value
        item = find_item_by_name_in_collection(value, cart)
        item[:count] += 1
      else
        item = find_item_by_name_in_collection(value, cart)
        item = {:count => 1}
        cart_consolidated << item
      end
    end
  end
  cart_consolidated
end


  