ActiveAdmin.register User do

  record = User.column_names

  permit_params record.each{|r| r.to_sym}, :password, :password_confirmation, subject_ids: []

  info_columns = %i(full_name nickname school college university role address contact contact_2 emergency_contact
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

  show do
    attributes_table do
      info_columns.each do |h|
        row h
      end
      row :image do |ad|
        image_tag ad.image.url unless ad.image.url.nil?
      end
    end

    panel "Tuition Subjects" do
      table_for user.subjects do
        column :name
        column :tution_class
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      info_columns.each do |attr|
        f.input attr
      end
      f.input :image, as: :file
    end

    inputs 'Tuition Subjects' do
      f.input :subject_ids, as: :tags, collection: Subject.all, display_name: :subject_display
    end

    f.actions
  end

  controller do
    def create
      unique_id = params[:user][:full_name].downcase.delete(' ') + rand.to_s[2..8]
      params[:user][:email] = "#{unique_id}@tc.com"
      params[:user][:password] = unique_id
      params[:user][:password_confirmation] = unique_id

      super
    end
  end

end
