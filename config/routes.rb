Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :prompts, only: [:index, :new, :create, :show, :destroy] do
    resources :code_reviews, only: [:index, :new, :create]
  end
  resources :code_reviews, only: [:show]
end
