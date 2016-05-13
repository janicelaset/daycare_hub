Rails.application.routes.draw do

  devise_for :admins, controllers: { registrations: "registrations"}
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'

  devise_for :users, controllers: { registrations: "user_registrations", passwords: "user_passwords" }

  resources :feedback_forms, only: [:new, :create]

  resources :users do
    get 'users/registration-instructions' => 'users#instructions', as: 'registration_instructions'
    get 'users/password-reset' => 'users#password_reset', as: 'password_reset_instructions'
    resources :daycares do
      member { get '/wizard/name'  => 'daycares#wizard' }
      member { get '/wizard/address'  => 'addresses#wizard' }
      member { get '/wizard/contact'  => 'contacts#wizard' }
      member { get '/wizard/general'  => 'generals#wizard' }
      member { get '/wizard/summary'  => 'summaries#wizard' }
      member { get '/wizard/image'  => 'images#wizard' }
      member { get '/wizard/program'  => 'programs#wizard' }
      member { get '/wizard/teacher'  => 'teachers#wizard' }
      member { get '/wizard/certification'  => 'certifications#wizard' }
      member { get '/wizard/additional'  => 'additionals#wizard' }
    end
  end

  resources :daycares do
    resources :addresses, only: [:new, :create, :update, :show]
    resources :contacts, only: [:new, :create, :update, :show]
    resources :generals, only: [:create, :update, :show]
    resources :summaries, only: [:create, :edit, :update, :destroy]
    resources :images, only: [:create, :edit, :update, :destroy] do
      collection { post :move }
    end
    resources :programs, only: [:create, :edit, :update, :destroy] do
      collection { post :move }
    end
    resources :teachers, only: [:create, :edit, :update, :destroy] do
      collection { post :move }
    end
    resources :certifications, only: [:create, :edit, :update, :destroy] do
      collection { post :move }
    end
    resources :additionals, only: [:create, :edit, :update, :destroy] do
      collection { post :move }
    end
    resources :contact_forms, only: [:create]
  end

  # resources :daycares do
  #   resources :contacts
  # end

  resources :users do
    resources :daycares do
      resources :images, only: [:index]
    end
  end

  # resources :daycares do
  #   resources :images, only: [:create, :edit, :update, :destroy] do
  #     collection { post :move }
  #   end
  # end

  # resources :daycares do
  #   resources :contact_forms, only: [:create]
  # end

  # resources :daycares do
  #   resources :summaries, only: [:create, :edit, :update, :destroy]
  # end


  # resources :daycares do
  #   resources :generals, only: [:create, :update, :show]
  # end

  # resources :daycares do
  #   resources :programs, only: [:create, :edit, :update, :destroy] do
  #     collection { post :move }
  #   end
  # end

  # resources :daycares do
  #   resources :certifications, only: [:create, :edit, :update, :destroy] do
  #     collection { post :move }
  #   end
  # end

  # resources :daycares do
  #   resources :teachers, only: [:create, :edit, :update, :destroy] do
  #     collection { post :move }
  #   end
  # end

  # resources :daycares do
  #   resources :additionals, only: [:create, :edit, :update, :destroy] do
  #     collection { post :move }
  #   end
  # end

  get '/about' => 'home#about', as: 'about'
  get '/daycare' => 'home#daycare', as: 'for_daycares'
  get '/parent' => 'home#parent', as: 'for_parents'
  get '/search-results' => 'home#show', as: 'search_results'
  get '/yourdaycare' => 'demos#show', as: 'demo'
  get '/:id' => 'daycares#show', as: 'daycare_profile'


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
