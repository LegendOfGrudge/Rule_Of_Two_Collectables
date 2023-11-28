class AboutController < ApplicationController
  def index
    @collections = Collection.includes(toys: { collection: :brand })
    @random_toy_images = {}

    @collections.each do |collection|
      random_toy = collection.toys.order(Arel.sql('RANDOM()')).first
      if random_toy
        brand_name = collection.brand&.name || 'N/A'
        @random_toy_images[collection.name] = {
          image: random_toy.image,
          brand_name: brand_name
        }
      end
    end
  end
end
