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

# G.I. Joe
brand = Brand.create(name: "G.I. Joe", description: "Step into the world of action-packed adventure with our G.I. Joe collectibles! Unleash the power of elite military forces and iconic characters with our extensive collection of action figures, vehicles, and memorabilia from the G.I. Joe universe. Whether you're a longtime fan of the Real American Hero series or the modern iterations, our selection caters to enthusiasts of all generations. Recreate thrilling battles and missions with highly detailed figures and vehicles that capture the essence of this legendary franchise. Gear up and join the ranks of G.I. Joe collectors with our exclusive selection of must-have items. Yo Joe!")
collection = Collection.create(name: '6" Classified Series', description: "Introducing the G.I. Joe Classified Series in 6 inches of pure action-packed glory! Unleash the power of highly detailed and articulated figures with our premium G.I. Joe Classified Series collection. Immerse yourself in the world of elite military forces with these meticulously crafted action figures that bring your favorite characters to life. From iconic heroes to formidable villains, each figure is a true collector's gem, capturing the essence of the Real American Hero series. Perfect for enthusiasts and collectors, our G.I. Joe Classified Series offers a dynamic and immersive experience, allowing you to recreate epic battles and missions. Elevate your G.I. Joe collection with these top-tier, 6-inch scale action figures and display your allegiance with pride!", brand:)

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
brand = Brand.create(name: "Star Wars", description: "Embark on an intergalactic adventure with our Star Wars collectibles! Immerse yourself in the epic saga of Jedi knights, Sith lords, and iconic characters from a galaxy far, far away. Explore our vast collection featuring action figures, statues, and memorabilia showcasing the beloved heroes and villains from the Star Wars universe. Whether you're a fan of the original trilogy, prequels, sequels, or standalone films, our selection caters to every Star Wars enthusiast. From lightsabers to detailed figurines, these collectibles are perfect for displaying your passion for the Force. May the collectible force be with you!")
collection = Collection.create(name: '6" Black Series', description: "Embark on an epic journey to a galaxy far, far away with our Star Wars 6 inch Black Series collection! Immerse yourself in the iconic saga with these premium, highly detailed action figures that capture the essence of your favorite characters. The Black Series is a celebration of craftsmanship and authenticity, offering collectors the opportunity to own a piece of the Star Wars universe in a 6-inch scale. From Jedi knights to Sith lords, each figure is a work of art, featuring intricate sculpting, realistic accessories, and multiple points of articulation for dynamic posing. Whether you're a seasoned collector or a Star Wars enthusiast, our 6 inch Black Series is a must-have, bringing the magic of the Force directly to your display shelves. May the collectible force be with you!", brand:)

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

collection = Collection.create(name: '3.75" Vintage Collection', description: "Journey back in time and relive the magic of the original Star Wars trilogy with our Star Wars: The Vintage Collection! Immerse yourself in nostalgia with these meticulously crafted, 3.75-inch action figures inspired by the classic characters and vehicles from a galaxy far, far away. The Vintage Collection pays homage to the timeless appeal of the Star Wars universe, featuring iconic heroes, villains, and vehicles in a vintage-style packaging that captures the essence of the beloved films. Perfect for collectors and fans of the original trilogy, each figure in The Vintage Collection is a miniature work of art, allowing you to recreate the excitement of the Star Wars universe in a compact scale. Embrace the force of nostalgia and add these classic treasures to your Star Wars collection today!", brand:)

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
brand = Brand.create(name: "Marvel", description: "Dive into the Marvel Universe with our extraordinary collection of collectibles! Unleash the superhero within as you explore our vast array of Marvel memorabilia, featuring iconic characters from the Avengers, X-Men, Spider-Man, and more. From action figures to limited-edition statues, our Marvel collection brings the epic tales and legendary battles to life. Whether you're a fan of the comics, movies, or TV series, our selection caters to every Marvel enthusiast. Assemble your own heroic display with our high-quality and intricately designed collectibles that celebrate the rich history and diverse characters of the Marvel Universe. Excelsior!")
collection = Collection.create(name: "Legends", description: "Dive into the Marvel multiverse with our Marvel Legends collection! Unleash the power of your favorite superheroes and villains with these highly detailed and articulated action figures. Marvel Legends is the ultimate series for collectors, featuring characters from the vast Marvel Universe in a 6-inch scale. From the Avengers to the X-Men, each figure is a masterpiece, capturing the essence of iconic characters with intricate sculpting, authentic accessories, and dynamic poses. Whether you're a die-hard fan or a casual collector, Marvel Legends offers a diverse range of figures that celebrate the rich history and thrilling adventures of Marvel comics, movies, and TV series. Elevate your collection with these premium figures and assemble your own legendary display of Marvel greatness!", brand:)

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
brand = Brand.create(name: "Transformers", description: "Transform your collection with our incredible Transformers lineup! Immerse yourself in the world of sentient robots that can change into vehicles, gadgets, and more. Explore our extensive range of Transformers collectibles, featuring classic Autobots and Decepticons, as well as the beloved characters from the Transformers universe. From intricate action figures to detailed replicas of iconic Transformers, our collection is a homage to the thrilling battles between the forces of good and evil. Whether you're a fan of the G1 era or the modern iterations, our selection caters to Transformers enthusiasts of all ages. Bring the excitement of Cybertron to your display shelves with our high-quality and dynamic Transformers collectibles!")
collection = Collection.create(name: "Studio Series", description: "Step into the action-packed world of Transformers with our Studio Series collection! Immerse yourself in the highly detailed and screen-accurate figures inspired by the blockbuster Transformers movies. The Studio Series brings your favorite characters to life in a premium way, capturing the essence of the cinematic experience. Each figure is meticulously designed and crafted to replicate the on-screen appearance of iconic Autobots and Decepticons, allowing fans and collectors to recreate epic moments from the films. Whether you're a fan of the classic battles or the modern iterations, our Studio Series offers a dynamic range of figures, from Deluxe to Leader Class, providing a true collector's experience. Elevate your Transformers collection with these top-tier, on-screen accurate figures and bring the cinematic magic to your display shelves!", brand:)

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

collection = Collection.create(name: "Masterpiece", description: "Transform your collection into a masterpiece with our Transformers Masterpiece series! Immerse yourself in the pinnacle of Transformers craftsmanship with these highly detailed and meticulously designed figures. The Masterpiece series showcases the most iconic Autobots and Decepticons in a scale that captures the true essence of the characters. Each figure is a work of art, featuring intricate sculpting, premium paint applications, and a high level of articulation for dynamic poses. Perfect for discerning collectors and fans who appreciate the utmost in Transformers authenticity, our Masterpiece series brings the beloved characters to life in ways that truly honor their legacy. Elevate your Transformers collection to new heights with these top-tier, collector-grade figures that stand as a testament to the enduring appeal of the Transformers universe.", brand:)

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
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
