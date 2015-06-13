Rails.application.routes.draw do

  root "categories#index"

  get "snippets/new" => "snippets#new", as: :snippets
  get "snippets/index" => "snippets#index"
  post "/snippets/new" => "snippets#create"
  resources :categories do
    resources :snippets, except: [:new]
  end
end
