# README


## Starting the app
cd to your Desktop
$ rails new wildlife-api-immikeoa -d postgresql -T
$ cd wildlife-api-immikeoa
$ rails db:create
Add the remote from GitHub => git remote add origin
Create the main branch => git branch -M main
Make an initial commit => git ad . => git commit -m "first commit" => git push -u origin main
$ bundle add rspec-rails
$ rails generate rspec:install
$ rails s
Code!

## Wildlife Tracker Challenge
The Forest Service is considering a proposal to place in conservancy a forest of virgin Douglas fir just outside of Portland, Oregon. Before they give the go ahead, they need to do an environmental impact study. They've asked you to build an API the rangers can use to report wildlife sightings.

### Story 1: In order to track wildlife sightings, as a user of the API, I need to manage animals.

✅Branch: animal-crud-actions

#### Acceptance Criteria

✅Create a resource for animal with the following information: common name and scientific_binomial
$ rails generate resource Animal common_name:string scientific_binomial:string
$ rails db:migrate
$ rails routes

✅Can see the data response of all the animals
$ rails c

✅Can create a new animal in the database

##### Creates the index method and (Read) http request

Animal.create(common_name: 'Dog', scientific_binomial:'Canis lupus familiaris')
Animal.create(common_name: 'Cat', scientific_binomial:'Felis catus')


def index
        animals =Animal.all
        render json: animals
end

get 'index' => 'animals#index', as: 'index'

##### creates the show method (Read) http request

def show
        animal = Animal.find(params[:id])
        render json: animal
end

get 'index/:id' => 'animals#show', as: 'show'

Can update an existing animal in the database
Can remove an animal entry in the database

### Story 2: In order to track wildlife sightings, as a user of the API, I need to manage animal sightings.

Branch: sighting-crud-actions

Acceptance Criteria

Create a resource for animal sightings with the following information: latitude, longitude, date
Hint: An animal has_many sightings (rails g resource Sighting animal_id:integer ...)
Hint: Date is written in Active Record as yyyy-mm-dd (“2022-07-28")
Can create a new animal sighting in the database
Can update an existing animal sighting in the database
Can remove an animal sighting in the database
Story 3: In order to see the wildlife sightings, as a user of the API, I need to run reports on animal sightings.

Branch: animal-sightings-reports

Acceptance Criteria

Can see one animal with all its associated sightings
Hint: Checkout this example on how to include associated records
Can see all the all sightings during a given time period
Hint: Your controller can use a range to look like this:
class SightingsController < ApplicationController
  def index
    sightings = Sighting.where(date: params[:start_date]..params[:end_date])
    render json: sightings
  end
end
Hint: Be sure to add the start_date and end_date to what is permitted in your strong parameters method
Hint: Utilize the params section in Postman to ease the developer experience
Hint: Routes with params
Stretch Challenges
Story 4: In order to see the wildlife sightings contain valid data, as a user of the API, I need to include proper specs.

Branch: animal-sightings-specs

Acceptance Criteria
Validations will require specs in spec/models and the controller methods will require specs in spec/requests.

Can see validation errors if an animal doesn't include a common name and scientific binomial
Can see validation errors if a sighting doesn't include latitude, longitude, or a date
Can see a validation error if an animal's common name exactly matches the scientific binomial
Can see a validation error if the animal's common name and scientific binomial are not unique
Can see a status code of 422 when a post request can not be completed because of validation errors
Hint: Handling Errors in an API Application the Rails Way
Story 5: In order to increase efficiency, as a user of the API, I need to add an animal and a sighting at the same time.

Branch: submit-animal-with-sightings

Acceptance Criteria

Can create new animal along with sighting data in a single API request
Hint: Look into accepts_nested_attributes_for