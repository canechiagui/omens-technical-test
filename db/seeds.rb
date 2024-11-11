puts "Cleaning database..."
Product.destroy_all

puts "Creating products..."
ebook = {name: "Ebook", price: 9.90, stock_quantity: 100,
  description: "How sleep improves your performance in sex."}

hormone_treatment = {name: "Hormone treatment", price: 199.90, stock_quantity: 20,
  description: "6-month follow-up with a specialist."}

[ebook, hormone_treatment].each do |products|
  product = Product.create!(products)
  puts "Created #{product.name}"
end
puts "Finished!"
