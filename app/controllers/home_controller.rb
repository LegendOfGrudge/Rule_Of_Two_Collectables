class HomeController < ApplicationController
  def index
    @expensiveToys = Toy.all.order("price DESC").limit(5)
    @toysOnSale = Toy.where("quantity > 95").order("quantity DESC").limit(5)
  end
end
