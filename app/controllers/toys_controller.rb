class ToysController < ApplicationController
  before_action :initialize_session
  before_action :load_cart

  def show
    @toy = Toy.find(params[:id])
  end

  def load_cart
    @cart = Toy.find(session[:cart])
  end

  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to cart_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to cart_path
  end
end
