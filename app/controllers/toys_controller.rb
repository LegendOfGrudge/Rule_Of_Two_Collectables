class ToysController < ApplicationController
  def show
    @toy = Toy.find(params[:id])
  end

  def add_to_cart
    id = params[:id].to_i
    price = params[:price].to_f
    quantity = params[:quantity].to_i

    # Check if the item with the same id already exists in the cart
    existing_item = session[:cart].find { |item| item[0] == id }

    if existing_item
      # If the item exists, update the quantity
      existing_item[2] += quantity
    else
      # If the item doesn't exist, add a new entry to the cart
      session[:cart] << [id, price, quantity]
    end

    redirect_to cart_path
  end

  def update_cart
    id = params[:id].to_i
    price = params[:price].to_f
    quantity = params[:quantity].to_i

    # Check for the item with the same id in the cart
    existing_item = session[:cart].find { |item| item[0] == id }

    if existing_item
      # If the item exists, update the quantity
      existing_item[2] = quantity
    end

    redirect_to cart_path
  end

  def remove_from_cart
    id = params[:id].to_i

    # Iterate through the cart and remove the sub-array with the matching id
    session[:cart].each_with_index do |item, index|
      if item[0] == id
        session[:cart].delete_at(index)
        break
      end
    end

    redirect_to cart_path
  end
end
