class BrandsController < ApplicationController
  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find(params[:id])
    @collections = Collection.where(brand_id: @brand.id).includes(:toys)

    @top_toys = []
    @collections.each do |collection|
      top_toys_collection = collection.toys.order(quantity: :desc).limit(5)
      @top_toys.concat(top_toys_collection)
    end
    @top_toys = @top_toys.sort_by { |toy| -toy.quantity }
  end
end
