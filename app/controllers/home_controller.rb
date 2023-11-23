class HomeController < ApplicationController
  def index
    @expensiveToys = Toy.all.order("price DESC").limit(5)
    @lowQuantityToys = Toy.all.order("quantity ASC").limit(5)
  end
end
