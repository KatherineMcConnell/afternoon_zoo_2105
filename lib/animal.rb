class Animal
  attr_reader :kind,
              :weight,
              :age

  def initialize(kind, weight, age)
    @kind = kind
    @weight = weight.to_s + " " + "pounds"
    @age = age.to_s + " " + "weeks"
  end

  def age_to_integer
    age.delete("weeks").to_i
  end

  def age_in_days
    age_to_integer * 7
  end

  def weight_to_integer
    @weight.delete("pounds").to_i
  end

  def feed!(pound)
    new_weight = weight_to_integer + pound
    @weight = new_weight.to_s + " " + "pounds"
  end
end
