class CartController < ApplicationController
  def index
  end

  def create_order
    require 'stripe'
    require 'json'

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

    productlist = [{:price_data =>{ :currency => "cad", :product_data => {:name => "Order"}, :unit_amount => order.order_subtotal }, :quantity => 1}]
    if (order.order_pst != 0)
      productlist << {:price_data =>{ :currency => "cad", :product_data => {:name => "PST", :description => "Provincial Sales Tax"}, :unit_amount => order.order_pst }, :quantity => 1}
    end
    if (order.order_hst != 0)
      productlist << {:price_data =>{ :currency => "cad", :product_data => {:name => "HST", :description => "Harmonized Sales Tax"}, :unit_amount => order.order_hst }, :quantity => 1}
    end
    if (order.order_gst != 0)
      productlist << {:price_data =>{ :currency => "cad", :product_data => {:name => "GST", :description => "Federal Goods and Services Tax"}, :unit_amount => order.order_gst }, :quantity => 1}
    end
    json_data = productlist.as_json
    puts json_data

    session[:cart] = []

    #Create Stripe session
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url: cart_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: cart_cancel_url,
      line_items: [json_data],
      mode: 'payment',
      phone_number_collection: {
        "enabled": true
      },
      shipping_address_collection: {
      allowed_countries: ['CA'],
      },
      billing_address_collection: "required",
      ui_mode: 'hosted',

    )

    puts(@session.url)
    redirect_to @session.url, allow_other_host: true
  end

  def success
    session_id = params[:session_id]
    order = Order.all.order(:created_at).last
    orderStatus = OrderStatus.find_by(name: "Paid")

    order.update(stripe_id: session_id.to_s)
    order.update(order_status: orderStatus)

    redirect_to root_path, allow_other_host:true
  end

  def cancel
    redirect_to root_path, allow_other_host:true
  end
end
