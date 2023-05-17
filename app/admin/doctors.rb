# ActiveAdmin.register Doctor do
#   permit_params :spec, :department, :full_name, :email, :status, :start_working_date, :gender, :category
#
#   config.clear_action_items!
#   index do
#     selectable_column
#     id_column
#     column :full_name
#     column :email
#     column :spec do |doc|
#       doc.spec.name_spec
#     end
#     column :department do |doc|
#       doc.department.name_depart
#     end
#     column :category do |doc|
#       doc.category.category_name
#     end
#     column :status
#     actions defaults: false do |doc|
#       link_to 'Edit', edit_admin_doctor_path(doc)
#     end
#   end
#
#   show do
#     attributes_table do
#       row :full_name
#       row :email
#       row :gender do |doc|
#         doc.gender.name_gender
#       end
#       row :spec do |doc|
#         doc.spec.name_spec
#       end
#       # row :department do |doc|
#       #   doc.department.name_depart
#       # end
#       row :category do |doc|
#         doc.category.category_name
#       end
#       row :start_working_date
#       row :status
#       row :created_at
#       row :updated_at
#     end
#   end
#
#   form do |f|
#     f.semantic_errors # Show error messages on :base instead of each attribute
#
#     f.inputs do
#       f.input :full_name
#       f.input :email
#       f.input :status
#       f.input :gender, collection: Gender.all.map {|g| [g.name_gender, g.id] }
#       f.input :spec, collection: Spec.all.map {|s| [s.name_spec, s.id] }
#       # f.input :department, collection: Department.all.map {|d| [d.name_depart, d.id] }
#       f.input :category, collection: Category.all.map {|c| [c.category_name, c.id] }
#       f.input :start_working_date
#     end
#     f.actions # Add buttons to submit/save and cancel
#   end
#
#   filter :spec, as: :select, collection: Spec.all.map {|s| [s.name_spec, s.id] }
#   # filter :department, as: :select, collection: Department.all.map {|d| [d.name_depart, d.id] }
#   filter :status, as: :select, collection: Doctor.statuses
#   filter :category, as: :select, collection: Category.all.map {|c| [c.category_name, c.id] }
# end
