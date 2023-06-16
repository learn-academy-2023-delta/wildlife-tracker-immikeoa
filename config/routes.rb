Rails.application.routes.draw do
  resources :animal_sightings
  resources :animals

  get 'index' => 'animals#index'
  post 'index/create' => 'animals#create'
  get 'index/:id' => 'animals#show'
  patch 'index/update/:id' => 'animals#update'
  delete 'index/destroy/:id' => 'animals#destroy'

  post 'index/sightings/create' => 'animal_sightings#create'
  patch 'index/sightings/update/:id' => 'animal_sightings#update'
  delete 'index/sightings/destroy/:id' => 'animal_sightings#destroy'
end
