EpicLandingPages::Application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :landing_pages
end
