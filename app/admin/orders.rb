ActiveAdmin.register Order do
  remove_filter :stripe_id
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :order_subtotal, :order_gst, :order_pst, :order_hst, :order_status_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :order_subtotal, :order_gst, :order_pst, :order_hst, :order_status_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
