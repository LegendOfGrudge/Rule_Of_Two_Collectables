class CollectionsController < ApplicationController
  def index
    @collections = Collection.all
  end

  def show
    @collection = Collection.find(params[:id])
    @toys = Toy.where(:collection_id => params[:id]).order("quantity DESC")
  end
end
