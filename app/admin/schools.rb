ActiveAdmin.register School do
  record = School.column_names

  permit_params record.each{|r| r.to_sym}
end
