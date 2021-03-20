Rails.application.routes.draw do
  mount PostgresqlLoStreamer::Engine => "/student_avatar"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :students, only: [:index, :show]
  root 'students#index'
end
