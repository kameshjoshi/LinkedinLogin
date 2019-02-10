Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  resources :auth do
  	collection do 
      get :linkedin
  	end
  end

  resources :profile
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
