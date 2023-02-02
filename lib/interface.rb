# 1. Print Welcome
puts "--------------------"
puts "Welcome to Instacart"
puts "--------------------"

# 2. Define your store (what items are for sale?)
store = {
  kiwi: { price: 1.25 },
  banana: { price: 0.5 },
  mango: { price: 4 },
  asparagus: { price: 9 },
}

# Print the store
puts "In our store today:"
store.each do |item, value|
  puts "#{item}: £#{value[:price]}"
end

item = ""
cart = {}

until item == "quit"
  # 3. Get items from the user (shopping)
  puts "Which item? (or 'quit' to checkout)"
  item = gets.chomp
  
  if item != "quit"
    if store.key?(item.to_sym)
      if !cart.key?(item.to_sym)
        cart[item.to_sym] = 0    
      end
      cart[item.to_sym] += 1
    else 
      puts "Sorry, we don't have #{item} today."
    end
  end
end 

# 4. Print the bill (checkout)
puts "-------BILL---------"
total = 0
cart.each do |item, amount|
  total += amount * store[item][:price] 
end
puts "TOTAL: £#{total}"
puts "--------------------"