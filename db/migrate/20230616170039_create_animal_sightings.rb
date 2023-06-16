class CreateAnimalSightings < ActiveRecord::Migration[7.0]
  belongs_to :animals
  def change
    create_table :animal_sightings do |t|
      t.integer :latitude
      t.integer :longitude
      t.string :date
      t.timestamps
    end
  end
end

class Person < ApplicationRecord
  has_many :emails
end