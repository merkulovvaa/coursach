ActiveAdmin.register Patient do
  permit_params :address, :birth_date, :email, :full_name, :phone_number, :gender_id

  index do
    selectable_column
    id_column
    column :full_name
    column :email
    column :gender do |pac|
      pac.gender.name_gender
    end
    column :phone_number
    column :birth_date
    column :address
    actions
  end

  filter :full_name
  filter :email
  filter :gender, as: :select, collection: Gender.all.map {|g| [g.name_gender, g.id] }
  filter :phone_number
  filter :birth_date
  filter :address

  show do
    attributes_table do
      row :full_name
      row :email
      row :gender do |pac|
        pac.gender.name_gender
      end
      row :phone_number
      row :birth_date
      row :address
    end
  end

  form do |f|
    f.inputs do
      f.input :full_name
      f.input :email
      f.input :gender, collection: Gender.all.map {|g| [g.name_gender, g.id] }
      f.input :phone_number
      f.input :birth_date
      f.input :address
    end
    f.actions
  end
end
