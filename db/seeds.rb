# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'
require 'faker'

Toy.delete_all
ToyType.delete_all
Collection.delete_all
Brand.delete_all
Province.delete_all
Order.delete_all
OrderProduct.delete_all

# Populate Provinces table
provinces_json_data = File.read(Rails.root.join("db/provinces.json"))
provinces = JSON.parse(provinces_json_data)

provinces.each do |province|
  Province.create!(
    name: province["name"],
    abbr: province["abbr"],
    gst:  province["gst"],
    pst:  province["pst"],
    hst:  province["hst"]
  )
end

OrderStatus.create(name: "New")
OrderStatus.create(name: "Paid")
OrderStatus.create(name: "Shipped")
OrderStatus.create(name: "Complete")

ToyType.create(type_name: "Statue")
toy_type = ToyType.create(type_name: "Action Figure")

# Populate Brands, Collections, Toys
brands_json_data = File.read(Rails.root.join("db/brands.json"))
brands = JSON.parse(brands_json_data)

brands.each do |brand_data|
  # Create the brand
  brand = Brand.create(
    name:        brand_data['name'],
    description: brand_data['description']
  )

  brand_data['collections'].each do |collection_data|
    # Create the collection
    collection = Collection.create(
      name:        collection_data['name'],
      description: collection_data['description'],
      brand:
    )

    # Parse CSV data
    csv_file = Rails.root.join("db/collections/#{collection_data['data_src']}")
    csv_data = File.read(csv_file)
    toys = CSV.parse(csv_data, headers: true)

    # Create toys
    toys.each do |toy|
      price_type = ['buy_price', 'auction_price', 'retail_price'].find { |type| toy[type].include? "C$" }
      next unless price_type

      price = toy[price_type]
      Toy.create(
        name: toy['figure_link'],
        full_name: toy['name'],
        description: toy['description'],
        quantity: Faker::Number.between(from: 1, to: 99),
        price: sprintf('%.2f', price[2..-1].to_f),
        image: "https://www.actionfigure411.com#{toy['image-src']}",
        collection: collection,
        toy_type: toy_type
      )

      puts "#{toy['figure_link']}"
    end
  end
end

puts "Created #{Brand.count} Brands"
puts "Created #{Collection.count} Collections"
puts "Created #{ToyType.count} Toy Types"
puts "Created #{Toy.count} Toys"
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
