Rails.application.routes.draw do
  resources :widgets, only: [:new, :create, :index] do
    resources :reviews

    collection do
      post :ship
    end
  end
end
