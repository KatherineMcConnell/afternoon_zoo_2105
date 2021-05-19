require 'rspec'
require './lib/animal'
require './lib/zoo'

RSpec.describe Zoo do
  before(:each) do
    @zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")
    @animal_1 = Animal.new("Sea Otter", 10, 25)
    @animal_2 = Animal.new("Red Panda", 5, 70)
    @animal_3 = Animal.new("Capybara", 100, 150)
    @animal_4 = Animal.new("Dolphin", 150, 200)
  end

  it 'exists' do

    expect(@zoo).to be_an_instance_of(Zoo)
  end

  it 'has attributes' do

    expect(@zoo.name).to eq("Bronx Zoo")
    expect(@zoo.street).to eq("2300 Southern Blvd")
    expect(@zoo.city).to eq("Bronx")
    expect(@zoo.state).to eq("NY")
    expect(@zoo.zip_code).to eq("10460")
  end

  it 'has an address' do

    expect(@zoo.address).to eq("2300 Southern Blvd Bronx, NY 10460")
  end

  it 'starts with no inventory and can add inventory' do

    expect(@zoo.inventory).to eq([])
    @zoo.add_animal(@animal_1)
    @zoo.add_animal(@animal_2)

    expect(@zoo.inventory).to eq([@animal_1, @animal_2])
  end

  it 'has animal_count instance method' do
    @zoo.add_animal(@animal_1)
    @zoo.add_animal(@animal_2)

    expect(@zoo.animal_count).to eq(2)
  end
#Iteration 3
  it 'can determine animals_older_than' do
    @zoo.add_animal(@animal_1)
    @zoo.add_animal(@animal_2)
    @zoo.add_animal(@animal_3)
    @zoo.add_animal(@animal_4)

    expect(@zoo.animals_older_than(250)).to eq([])

    expect(@zoo.animals_older_than(100)).to eq([@animal_3,@animal_4])

    oldies = [@animal_1,@animal_2,@animal_3,@animal_4]
    expect(@zoo.animals_older_than(10)).to eq(oldies)
  end

  it 'can calculate total_weight_of_animals' do
    @zoo.add_animal(@animal_1)
    @zoo.add_animal(@animal_2)
    @zoo.add_animal(@animal_3)
    @zoo.add_animal(@animal_4)

    expect(@zoo.total_weight_of_animals).to eq(265)
  end

  it 'has zoo_details key:values' do
    @zoo.add_animal(@animal_1)
    @zoo.add_animal(@animal_2)
    @zoo.add_animal(@animal_3)
    @zoo.add_animal(@animal_4)

    expect(@zoo.details).to eq({"total_weight" => 265,
                                "street_address" => "2300 Southern Blvd"})
  end
end
