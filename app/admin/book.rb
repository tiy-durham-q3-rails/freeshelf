ActiveAdmin.register Book do

menu priority: 2
index do
  column :title, :sortable => true
  column :year_created, :sortable => true
  column :url, :sortable => true
  column :creator, :sortable => true
  column :description, :sortable => true
  actions

end

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :year_created, :url, :creator, :description, :cover, :document, :slug
  #
  # or
#
#   permit_params do
#    permitted = [:permitted, :attributes]
#    permitted << :other if resource.something?
#    permitted
#   end
#
end
