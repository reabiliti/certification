Rails.application.routes.draw do

  root 'welcome#index'

  resources :settings
  resources :certificates

  resources :proposals do
    resources :solution_proposals
  end

  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
