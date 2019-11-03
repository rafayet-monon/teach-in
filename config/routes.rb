Rails.application.routes.draw do
  draw :admin # admin routes 'config/routes/admin.rb'
  draw :api_v1 # api v1 routes 'config/routes/api_v1.rb'
  draw :web # api v1 routes 'config/routes/web.rb'
end
