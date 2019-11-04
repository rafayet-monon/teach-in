ActiveAdmin.register TutionClass do

  record = TutionClass.column_names

  permit_params record.each{|r| r.to_sym}
  
end
