class BrandsController < ApplicationController
  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find(params[:id])
    @collections = Collection.where(:brand_id => params[:id])
  end
end
