class CollectionsController < ApplicationController
  def index
    @collections = Collection.all
  end

  def show
    @collection = Collection.find(params[:id])
    @toys = Toy.where(collection_id: params[:id])

    case params[:sort_by]
    when 'alphabetical_asc'
      @toys = @toys.order(name: :asc)
    when 'alphabetical_desc'
      @toys = @toys.order(name: :desc)
    when 'price_desc'
      @toys = @toys.order(price: :desc)
    when 'price_asc'
      @toys = @toys.order(price: :asc)
    when 'quantity_desc'
      @toys = @toys.order(quantity: :desc)
    when 'quantity_asc'
      @toys = @toys.order(quantity: :asc)
    else
      # Default sorting if no option is selected
      @toys = @toys.order(quantity: :desc)
    end

    @toys = @toys.page(params[:page])
  end
end
