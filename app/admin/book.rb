ActiveAdmin.register Book do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :publish_year, :url, :author, :description, :cover, :document, :slug
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
