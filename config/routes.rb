Mfk::Application.routes.draw do
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"  

  resources :sessions

  namespace :admin do
    resources :users
  end
end
#== Route Map
# Generated on 24 May 2013 00:38
#
#          logout GET    /logout(.:format)               sessions#destroy
#        sessions GET    /sessions(.:format)             sessions#index
#                 POST   /sessions(.:format)             sessions#create
#     new_session GET    /sessions/new(.:format)         sessions#new
#    edit_session GET    /sessions/:id/edit(.:format)    sessions#edit
#         session GET    /sessions/:id(.:format)         sessions#show
#                 PUT    /sessions/:id(.:format)         sessions#update
#                 DELETE /sessions/:id(.:format)         sessions#destroy
#     admin_users GET    /admin/users(.:format)          admin/users#index
#                 POST   /admin/users(.:format)          admin/users#create
#  new_admin_user GET    /admin/users/new(.:format)      admin/users#new
# edit_admin_user GET    /admin/users/:id/edit(.:format) admin/users#edit
#      admin_user GET    /admin/users/:id(.:format)      admin/users#show
#                 PUT    /admin/users/:id(.:format)      admin/users#update
#                 DELETE /admin/users/:id(.:format)      admin/users#destroy
