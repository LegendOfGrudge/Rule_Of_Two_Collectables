ActiveAdmin.register Toy do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :full_name, :description, :quantity, :toy_type_id, :collection_id, :price, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :full_name, :description, :quantity, :toy_type_id, :collection_id, :price, :image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
