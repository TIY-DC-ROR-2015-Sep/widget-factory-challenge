Rails.application.routes.draw do
  resources :widgets, only: [:new, :create, :index] do
    collection do
      post :ship
    end
  end
end
