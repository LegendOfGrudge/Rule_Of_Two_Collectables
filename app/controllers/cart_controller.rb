class CartController < ApplicationController
  def index
    @cart = Toy.find(session[:cart])
  end
end
