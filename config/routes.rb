EpicLandingPages::Application.routes.draw do
  root 'welcome#index'

  resources :landing_pages
end
