class Customer
    #Each customer instance has a name and an age. Their name and age are set upon initialization, and because we created an attribute accessor for both, the customer can change their name or age. If we wanted to limit this ability to read-only, we would create an attribute reader instead. The Customer class also has a class variable that tracks every instance of customer upon creation.
  attr_accessor :name, :age

  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

  #If you take a look at our customer right now, they aren't capable of doing much. Let's change that and give them the ability to create a meal. To do this, they'll need to take in an instance of a waiter and supply the total and tip, which we'll have defaulted to 0 here as well:

  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end 

  def meals
    Meal.all.select { |meal| meal.customer == self}
  end 

  def waiters
    meals.map{ |meal| meal.waiter}
  end
  
end