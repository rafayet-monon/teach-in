ActiveAdmin.register User do

  record = User.column_names

  permit_params record.each{|r| r.to_sym}, :password, :password_confirmation

  info_columns = %i(full_name nickname email school college university role address contact contact_2 emergency_contact
   sex birth_date)

  info_columns.each do |attr|
    filter attr
  end

  index do
    _h = info_columns
    selectable_column
    id_column
    _h.each do |h|
      column h
    end

    actions
  end

  form do |f|
    f.inputs do
      info_columns.each do |attr|
        f.input attr
      end
      f.input :image, as: :file
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
