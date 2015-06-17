Rails.application.routes.draw do

  resources :users, only: [:new, :create] do
    get :edit, on: :collection
    patch :update, on: :collection
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  root "categories#index"

  get "snippets/new" => "snippets#new", as: :snippets
  get "snippets/index" => "snippets#index"
  post "/snippets/new" => "snippets#create"
  resources :categories do
    resources :snippets, except: [:new]
  end
end
