Rails.application.routes.draw do
  resources :animals
  get 'index' => 'animals#index', as: 'index'
  post 'index/add' => 'animals#create'
  get 'index/:id' => 'animals#show', as: 'show'
end
