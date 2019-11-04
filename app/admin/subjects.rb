ActiveAdmin.register Subject do

  record = Subject.column_names

  permit_params record.each{|r| r.to_sym}
  
end
