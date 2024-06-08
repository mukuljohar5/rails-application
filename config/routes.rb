Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/click_button" => "admin/users#click_button"
  # Defines the root path route ("/")
  root "admin#index"
  authenticate :user do
    get "/admin" => "admin#index"
  end

  scope :admin, module: :admin do
    authenticate :user do
      resources :users
    end
  end
end
