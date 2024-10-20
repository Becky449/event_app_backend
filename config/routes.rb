Rails.application.routes.draw do
    resources :events, only: [:create, :show] do
    resources :media, only: [:create, :index]
  end
end
