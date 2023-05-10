ActiveAdmin.register Doctor do
  permit_params :spec, :department, :full_name, :email, :status, :start_working_date, :gender

  config.remove_action_item(:destroy)
  index do
    selectable_column
    id_column
    column :full_name
    column :email
    column :spec do |doc|
      doc.spec.name_spec
    end
    column :department do |doc|
      doc.department.name_depart
    end
    column :status
    actions
  end


  show do
    attributes_table do
      row :full_name
      row :email
      row :gender do |doc|
        doc.gender.name_gender
      end
      row :spec do |doc|
        doc.spec.name_spec
      end
      row :department do |doc|
        doc.department.name_depart
      end
      row :start_working_date
      row :status
      row :created_at
      row :updated_at
    end
  end


    form do |f|
      f.semantic_errors # Show error messages on :base instead of each attribute

      f.inputs do
        f.input :full_name
        f.input :email
        f.input :status
        f.input :gender, collection: Gender.all.map {|g| [g.name_gender, g.id] }
        f.input :spec, collection: Spec.all.map {|s| [s.name_spec, s.id] }
        f.input :department, collection: Department.all.map {|d| [d.name_depart, d.id] }
        f.input :start_working_date
      end
      f.actions # Add buttons to submit/save and cancel
    end
  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at
  #
  # form do |f|
  #   f.inputs do
  #     f.input :email
  #     f.input :password
  #     f.input :password_confirmation
  #   end
  #   f.actions
  # end

end
