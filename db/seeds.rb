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

ToyType.create(type_name: "Statue")
toy_type = ToyType.create(type_name: "Action Figure")

# G.I. Joe
brand = Brand.create(name: "G.I. Joe")
collection = Collection.create(name: '6" Classified Series', brand:)

csv_file = Rails.root.join('db/gi_joe_classified.csv')
csv_data = File.read(csv_file)

toys = CSV.parse(csv_data, headers: true)

toys.each do |toy|
  if (toy['buy_price'].include? "C$")
    price = toy['buy_price']

    Toy.create(
      name: toy['figure_link'],
      full_name: toy['name'],
      description: toy['description'],
      quantity: Faker::Number.between(from: 1, to: 99),
      price: sprintf('%.2f', price[2..-1].to_f),
      image: "https://www.actionfigure411.com#{toy['image-src']}",
      collection:,
      toy_type:
    )

    puts "#{toy['figure_link']}"
  else
    if (toy['auction_price'].include? "C$")
      price = toy['auction_price']

      Toy.create(
        name: toy['figure_link'],
        full_name: toy['name'],
        description: toy['description'],
        quantity: Faker::Number.between(from: 1, to: 99),
        price: sprintf('%.2f', price[2..-1].to_f),
        image: "https://www.actionfigure411.com#{toy['image-src']}",
        collection:,
        toy_type:
      )

      puts "#{toy['figure_link']}"
    else
      if (toy['retail_price'].include? "C$")
        price = toy['retail_price']

        Toy.create(
          name: toy['figure_link'],
          full_name: toy['name'],
          description: toy['description'],
          quantity: Faker::Number.between(from: 1, to: 99),
          price: sprintf('%.2f', price[2..-1].to_f),
          image: "https://www.actionfigure411.com#{toy['image-src']}",
          collection:,
          toy_type:
        )

        puts "#{toy['figure_link']}"
      end
    end
  end
end

# Star Wars
brand = Brand.create(name: "Star Wars")
collection = Collection.create(name: '6" Black Series', brand:)

csv_file = Rails.root.join('db/black_series.csv')
csv_data = File.read(csv_file)

toys = CSV.parse(csv_data, headers: true)

toys.each do |toy|
  if (toy['buy_price'].include? "C$")
    price = toy['buy_price']

    Toy.create(
      name: toy['figure_link'],
      full_name: toy['name'],
      description: toy['description'],
      quantity: Faker::Number.between(from: 1, to: 99),
      price: sprintf('%.2f', price[2..-1].to_f),
      image: "https://www.actionfigure411.com#{toy['image-src']}",
      collection:,
      toy_type:
    )

    puts "#{toy['figure_link']}"
  else
    if (toy['auction_price'].include? "C$")
      price = toy['auction_price']

      Toy.create(
        name: toy['figure_link'],
        full_name: toy['name'],
        description: toy['description'],
        quantity: Faker::Number.between(from: 1, to: 99),
        price: sprintf('%.2f', price[2..-1].to_f),
        image: "https://www.actionfigure411.com#{toy['image-src']}",
        collection:,
        toy_type:
      )

      puts "#{toy['figure_link']}"
    else
      if (toy['retail_price'].include? "C$")
        price = toy['retail_price']

        Toy.create(
          name: toy['figure_link'],
          full_name: toy['name'],
          description: toy['description'],
          quantity: Faker::Number.between(from: 1, to: 99),
          price: sprintf('%.2f', price[2..-1].to_f),
          image: "https://www.actionfigure411.com#{toy['image-src']}",
          collection:,
          toy_type:
        )

        puts "#{toy['figure_link']}"
      end
    end
  end
end

collection = Collection.create(name: '3.75" Vintage Collection', brand:)

csv_file = Rails.root.join('db/vintage_collection.csv')
csv_data = File.read(csv_file)

toys = CSV.parse(csv_data, headers: true)

toys.each do |toy|
  if (toy['buy_price'].include? "C$")
    price = toy['buy_price']

    Toy.create(
      name: toy['figure_link'],
      full_name: toy['name'],
      description: toy['description'],
      quantity: Faker::Number.between(from: 1, to: 99),
      price: sprintf('%.2f', price[2..-1].to_f),
      image: "https://www.actionfigure411.com#{toy['image-src']}",
      collection:,
      toy_type:
    )

    puts "#{toy['figure_link']}"
  else
    if (toy['auction_price'].include? "C$")
      price = toy['auction_price']

      Toy.create(
        name: toy['figure_link'],
        full_name: toy['name'],
        description: toy['description'],
        quantity: Faker::Number.between(from: 1, to: 99),
        price: sprintf('%.2f', price[2..-1].to_f),
        image: "https://www.actionfigure411.com#{toy['image-src']}",
        collection:,
        toy_type:
      )

      puts "#{toy['figure_link']}"
    else
      if (toy['retail_price'].include? "C$")
        price = toy['retail_price']

        Toy.create(
          name: toy['figure_link'],
          full_name: toy['name'],
          description: toy['description'],
          quantity: Faker::Number.between(from: 1, to: 99),
          price: sprintf('%.2f', price[2..-1].to_f),
          image: "https://www.actionfigure411.com#{toy['image-src']}",
          collection:,
          toy_type:
        )

        puts "#{toy['figure_link']}"
      end
    end
  end
end

# Marvel
brand = Brand.create(name: "Marvel")
collection = Collection.create(name: "Legends", brand:)

csv_file = Rails.root.join('db/marvel_legends.csv')
csv_data = File.read(csv_file)

toys = CSV.parse(csv_data, headers: true)

toys.each do |toy|
  if (toy['buy_price'].include? "C$")
    price = toy['buy_price']

    Toy.create(
      name: toy['figure_link'],
      full_name: toy['name'],
      description: toy['description'],
      quantity: Faker::Number.between(from: 1, to: 99),
      price: sprintf('%.2f', price[2..-1].to_f),
      image: "https://www.actionfigure411.com#{toy['image-src']}",
      collection:,
      toy_type:
    )

    puts "#{toy['figure_link']}"
  else
    if (toy['auction_price'].include? "C$")
      price = toy['auction_price']

      Toy.create(
        name: toy['figure_link'],
        full_name: toy['name'],
        description: toy['description'],
        quantity: Faker::Number.between(from: 1, to: 99),
        price: sprintf('%.2f', price[2..-1].to_f),
        image: "https://www.actionfigure411.com#{toy['image-src']}",
        collection:,
        toy_type:
      )

      puts "#{toy['figure_link']}"
    else
      if (toy['retail_price'].include? "C$")
        price = toy['retail_price']

        Toy.create(
          name: toy['figure_link'],
          full_name: toy['name'],
          description: toy['description'],
          quantity: Faker::Number.between(from: 1, to: 99),
          price: sprintf('%.2f', price[2..-1].to_f),
          image: "https://www.actionfigure411.com#{toy['image-src']}",
          collection:,
          toy_type:
        )

        puts "#{toy['figure_link']}"
      end
    end
  end
end

# Transformers
brand = Brand.create(name: "Transformers")
collection = Collection.create(name: "Studio Series", brand:)

csv_file = Rails.root.join('db/transformers_studio_series.csv')
csv_data = File.read(csv_file)

toys = CSV.parse(csv_data, headers: true)

toys.each do |toy|
  if (toy['buy_price'].include? "C$")
    price = toy['buy_price']

    Toy.create(
      name: toy['figure_link'],
      full_name: toy['name'],
      description: toy['description'],
      quantity: Faker::Number.between(from: 1, to: 99),
      price: sprintf('%.2f', price[2..-1].to_f),
      image: "https://www.actionfigure411.com#{toy['image-src']}",
      collection:,
      toy_type:
    )

    puts "#{toy['figure_link']}"
  else
    if (toy['auction_price'].include? "C$")
      price = toy['auction_price']

      Toy.create(
        name: toy['figure_link'],
        full_name: toy['name'],
        description: toy['description'],
        quantity: Faker::Number.between(from: 1, to: 99),
        price: sprintf('%.2f', price[2..-1].to_f),
        image: "https://www.actionfigure411.com#{toy['image-src']}",
        collection:,
        toy_type:
      )

      puts "#{toy['figure_link']}"
    else
      if (toy['retail_price'].include? "C$")
        price = toy['retail_price']

        Toy.create(
          name: toy['figure_link'],
          full_name: toy['name'],
          description: toy['description'],
          quantity: Faker::Number.between(from: 1, to: 99),
          price: sprintf('%.2f', price[2..-1].to_f),
          image: "https://www.actionfigure411.com#{toy['image-src']}",
          collection:,
          toy_type:
        )

        puts "#{toy['figure_link']}"
      end
    end
  end
end

collection = Collection.create(name: "Masterpiece", brand:)

csv_file = Rails.root.join('db/transformers_masterpiece.csv')
csv_data = File.read(csv_file)

toys = CSV.parse(csv_data, headers: true)

toys.each do |toy|
  if (toy['buy_price'].include? "C$")
    price = toy['buy_price']

    Toy.create(
      name: toy['figure_link'],
      full_name: toy['name'],
      description: toy['description'],
      quantity: Faker::Number.between(from: 1, to: 99),
      price: sprintf('%.2f', price[2..-1].to_f),
      image: "https://www.actionfigure411.com#{toy['image-src']}",
      collection:,
      toy_type:
    )

    puts "#{toy['figure_link']}"
  else
    if (toy['auction_price'].include? "C$")
      price = toy['auction_price']

      Toy.create(
        name: toy['figure_link'],
        full_name: toy['name'],
        description: toy['description'],
        quantity: Faker::Number.between(from: 1, to: 99),
        price: sprintf('%.2f', price[2..-1].to_f),
        image: "https://www.actionfigure411.com#{toy['image-src']}",
        collection:,
        toy_type:
      )

      puts "#{toy['figure_link']}"
    else
      if (toy['retail_price'].include? "C$")
        price = toy['retail_price']

        Toy.create(
          name: toy['figure_link'],
          full_name: toy['name'],
          description: toy['description'],
          quantity: Faker::Number.between(from: 1, to: 99),
          price: sprintf('%.2f', price[2..-1].to_f),
          image: "https://www.actionfigure411.com#{toy['image-src']}",
          collection:,
          toy_type:
        )

        puts "#{toy['figure_link']}"
      end
    end
  end
end

puts "Created #{Brand.count} Brands"
puts "Created #{Collection.count} Collections"
puts "Created #{ToyType.count} Toy Types"
puts "Created #{Toy.count} Toys"