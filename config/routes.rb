Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  get 'welcome/index'
  root 'welcome#index'

end
