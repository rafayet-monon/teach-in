ActiveAdmin.register University do

  record = University.column_names

  permit_params record.each{|r| r.to_sym}
  
end
