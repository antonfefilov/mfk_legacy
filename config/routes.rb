Mfk::Application.routes.draw do
  namespace :admin do
    resources :users
  end
end
#== Route Map
# Generated on 22 May 2013 08:41
#
#                 POST   /admin/users(.:format)          admin/users#create
#  new_admin_user GET    /admin/users/new(.:format)      admin/users#new
# edit_admin_user GET    /admin/users/:id/edit(.:format) admin/users#edit
#      admin_user GET    /admin/users/:id(.:format)      admin/users#show
#                 PUT    /admin/users/:id(.:format)      admin/users#update
#                 DELETE /admin/users/:id(.:format)      admin/users#destroy
