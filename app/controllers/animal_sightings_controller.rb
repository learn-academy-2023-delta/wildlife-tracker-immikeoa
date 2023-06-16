class AnimalSightingsController < ApplicationController
    def create
      sighting = AnimalSighting.create(animal_sighting_params)
      if sighting.valid?
        render json: sighting
      else
        render json: sighting.errors
      end
    end
  
    def update
      sighting = AnimalSighting.find(params[:id])
      if sighting.update(animal_sighting_params)
        render json: sighting
      else
        render json: sighting.errors
      end
    end
  
    def destroy
      sighting = AnimalSighting.find(params[:id])
      if sighting.destroy
        render json: sighting
      else
        render json: sighting.errors
      end
    end
  
    private
  
    def animal_sighting_params
      params.require(:animal_sighting).permit(:latitude, :longitude, :date)
    end
  end
  