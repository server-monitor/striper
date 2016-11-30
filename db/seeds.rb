
Product.delete_all

10.times do
  Product.create!(
    name: Faker::Commerce.product_name,
    description: Faker::Company.catch_phrase,
    price: Faker::Commerce.price,
    count: 10 + rand(100),
    sku: Faker::Number.number(8)
  )
end
