ActiveAdmin.register Book do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :publish_year, :url, :author, :description, :cover, :document, :slug, :taggable_type

#   index do
#     column :taggable_type do |project|
#       link_to project.title, admin_project_path(project)
#     end
#
#     default_actions
#   end
#
# # Filter only by title
#   filter :title
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
