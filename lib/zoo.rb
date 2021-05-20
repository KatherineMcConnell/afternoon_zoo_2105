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
    "#{@street} #{@city}, #{@state} #{zip_code}"
  end

  def add_animal(animal)
    @inventory << animal
  end

  def animal_count
    @inventory.length
  end

  def animals_older_than(age)
    @inventory.find_all { |animal| (animal.age_in_days/7) > age}
  end

  def total_weight_of_animals
    @inventory.sum do |animal|
      animal.weight.split.first.to_i
    end
  end

  def details
    {"total_weight"=> total_weight_of_animals, "street_address"=> @street}
  end

  def animals_sorted_by_weight
    @inventory.sort_by {|animal| animal.weight.split.first.to_i}.reverse
  end

  def animal_hash
    animal_hash = Hash.new{|hash,key| hash[key] = []}
    @inventory.each do |animal|
      animal_hash[animal.kind.chr] << animal
    end
    animal_hash
  end


end
