class AddAnimalIdToAnimalSightings < ActiveRecord::Migration[7.0]
  def change
    add_column :animal_sightings, :animal_id, :integer
  end
end
