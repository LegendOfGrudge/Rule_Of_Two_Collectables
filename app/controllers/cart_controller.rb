class CartController < ApplicationController
  def index
  end

  def create_order
    subtotal = params[:subtotal].to_i
    gst = subtotal * current_user.province.gst
    pst = subtotal * current_user.province.pst
    hst = subtotal * current_user.province.hst
    status = OrderStatus.find_by(name: "New")
    order = Order.create(user: current_user, order_subtotal: subtotal, order_gst: gst, order_pst: pst, order_hst: hst, order_status: status)

    session[:cart].each do |item|
      toy = Toy.find(item[0])
      product_cost = (item[1] * 100).to_i
      product_quantity = item[2].to_i

      OrderProduct.create(toy: toy, order: order, product_cost: product_cost, product_quantity: product_quantity)

      # Update toy quantity in the database
      new_quantity = toy.quantity - product_quantity
      toy.update(quantity: new_quantity)
    end

    session[:cart] = []

    redirect_to home_path
  end
end
