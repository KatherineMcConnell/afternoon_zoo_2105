class Zoo
  attr_reader :name,
              :street,
              :city,
              :state,
              :zip_code,
              :inventory

  def initialize(name, street, city, state, zip_code)
    @name = name
    @street = street
    @city = city
    @state = state
    @zip_code = zip_code
    @inventory = []
  end

  def address
    @street + " " + @city + ", " + @state + " " + @zip_code
  end

  def add_animal(animal)
    @inventory << animal
  end

  def animal_count
    @inventory.length
  end

  def animals_older_than(older_than)
      older_animals = []
      @inventory.each do |animal|
        @animal.age_to_integer > older_than
        older_animals << animal
      end
      older_animals
  end

  def total_weight_of_animals
    @inventory.sum do |animal|
      animal.weight_to_integer
    end
  end

  def details
    details_h = {}
    details_h["total_weight"] = total_weight_of_animals
    details_h["street_address"] = @street
  end
end
