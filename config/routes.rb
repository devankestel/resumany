Rails.application.routes.draw do
  get '/resumes/download' => 'resumes#download', as: :downloads
  resources :resumes do
    resource :downloads
    resource :displays
  end

#                 Prefix Verb   URI Pattern                       Controller#Action
#              downloads GET    /resumes/download(.:format)       resumes#download
#      resumes_downloads POST   /resumes/downloads(.:format)      downloads#create
#  new_resumes_downloads GET    /resumes/downloads/new(.:format)  downloads#new
# edit_resumes_downloads GET    /resumes/downloads/edit(.:format) downloads#edit
#                        GET    /resumes/downloads(.:format)      downloads#show
#                        PATCH  /resumes/downloads(.:format)      downloads#update
#                        PUT    /resumes/downloads(.:format)      downloads#update
#                        DELETE /resumes/downloads(.:format)      downloads#destroy
#       resumes_displays POST   /resumes/displays(.:format)       displays#create
#   new_resumes_displays GET    /resumes/displays/new(.:format)   displays#new
#  edit_resumes_displays GET    /resumes/displays/edit(.:format)  displays#edit
#                        GET    /resumes/displays(.:format)       displays#show
#                        PATCH  /resumes/displays(.:format)       displays#update
#                        PUT    /resumes/displays(.:format)       displays#update
#                        DELETE /resumes/displays(.:format)       displays#destroy
#                resumes POST   /resumes(.:format)                resumes#create
#            new_resumes GET    /resumes/new(.:format)            resumes#new
#           edit_resumes GET    /resumes/edit(.:format)           resumes#edit
#                        GET    /resumes(.:format)                resumes#show
#                        PATCH  /resumes(.:format)                resumes#update
#                        PUT    /resumes(.:format)                resumes#update
#                        DELETE /resumes(.:format)                resumes#destroy


#                 Prefix Verb   URI Pattern                                      Controller#Action
#            downloads GET    /resumes/download(.:format)                      resumes#download
#     resume_downloads GET    /resumes/:resume_id/downloads(.:format)          downloads#index
#                      POST   /resumes/:resume_id/downloads(.:format)          downloads#create
#  new_resume_download GET    /resumes/:resume_id/downloads/new(.:format)      downloads#new
# edit_resume_download GET    /resumes/:resume_id/downloads/:id/edit(.:format) downloads#edit
#      resume_download GET    /resumes/:resume_id/downloads/:id(.:format)      downloads#show
#                      PATCH  /resumes/:resume_id/downloads/:id(.:format)      downloads#update
#                      PUT    /resumes/:resume_id/downloads/:id(.:format)      downloads#update
#                      DELETE /resumes/:resume_id/downloads/:id(.:format)      downloads#destroy
#              resumes GET    /resumes(.:format)                               resumes#index
#                      POST   /resumes(.:format)                               resumes#create
#           new_resume GET    /resumes/new(.:format)                           resumes#new
#          edit_resume GET    /resumes/:id/edit(.:format)                      resumes#edit
#               resume GET    /resumes/:id(.:format)                           resumes#show
#                      PATCH  /resumes/:id(.:format)                           resumes#update
#                      PUT    /resumes/:id(.:format)                           resumes#update
#                      DELETE /resumes/:id(.:format)                           resumes#destroy

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
