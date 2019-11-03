devise_for :admin_users, ActiveAdmin::Devise.config
ActiveAdmin.routes(self) rescue ActiveAdmin::DatabaseHitDuringLoad
