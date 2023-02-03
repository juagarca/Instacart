# 1. Print Welcome
puts "--------------------"
puts "Welcome to Instacart"
puts "--------------------"

# 2. Define your store (what items are for sale?)
store = {
  kiwi: { price: 1.25, stock: 5 },
  banana: { price: 0.5,  stock: 1 },
  mango: { price: 4, stock: 10 },
  asparagus: { price: 9, stock: 1 },
}

# Print the store
puts "In our store today:"
store.each do |item, price_and_stock|
  puts "#{item}: £#{price_and_stock[:price]}"
end

item = ""
cart = {}

until item == "quit"
  # 3. Get items from the user (shopping)
  puts "Which item? (or 'quit' to checkout)"
  item = gets.chomp
  
  if item != "quit"
    if store.key?(item.to_sym)
      # If the store has the item, we ask for how many
      puts "How many?"
      quantity = gets.chomp.to_i
        # If the store has enough stock for the item
        if store[item.to_sym][:stock] >= quantity
          # If the cart does not have the item yet we need to initialize the quantity to 0 first
          if !cart.key?(item.to_sym)
            cart[item.to_sym] = 0    
          end
          # We sum the quantity chosen to the previous item quantity
          cart[item.to_sym] += quantity
          store[item.to_sym][:stock] -= quantity
        # If the store doesn't have enough stock for the item
        else
          puts "Sorry, there are only #{store[item.to_sym][:stock]} #{item}(s) left."
        end
      # If the store doesn't have the item in stock
      else 
      puts "Sorry, we don't have #{item} today."
    end
  end
end 

# 4. Print the bill (checkout)
puts "-------BILL---------"
bill = 0
cart.each do |item, quantity|
  total = quantity * store[item][:price] 
  bill += total
  # Prints every individual item in the cart with its quantity
  puts "#{item}: #{quantity} x £#{store[item.to_sym][:price]} = £#{total}"
end
# Prints the total bill
puts "TOTAL: £#{bill}"
puts "--------------------"