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
      puts "How many?"
      quantity = gets.chomp.to_i
        if store[item.to_sym][:stock] >= quantity
          if !cart.key?(item.to_sym)
            cart[item.to_sym] = 0    
          end
          cart[item.to_sym] += quantity
          store[item.to_sym][:stock] -= quantity
        else
          puts "Sorry, there are only #{store[item.to_sym][:stock]} #{item}(s) left."
        end
      else 
      puts "Sorry, we don't have #{item} today."
    end
  end
end 

# 4. Print the bill (checkout)
puts "-------BILL---------"
bill = 0
cart.each do |item, amount|
  total = amount * store[item][:price] 
  bill += total
  puts "#{item}: #{amount} x £#{store[item.to_sym][:price]} = £#{total}"
end
puts "TOTAL: £#{bill}"
puts "--------------------"