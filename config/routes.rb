Rails.application.routes.draw do
  resources :animals
  get 'index' => 'animals#index'
  post 'index/crete' => 'animals#create'
  get 'index/:id' => 'animals#show'
  patch 'index/update/:id' => 'animals#update'
  delete 'index/destroy/:id' => 'animals#destroy'
end
