ActiveAdmin.register College do

  record = College.column_names

  permit_params record.each{|r| r.to_sym}
  
end
