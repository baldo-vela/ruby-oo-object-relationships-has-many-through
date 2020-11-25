class Waiter
    #Each instance of the Waiter class has a name and an attribute describing their years of experience. Just like the Customer class, the Waiter class has a class variable that stores every waiter instance upon initialization.
    attr_accessor :name, :yrs_experience

    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end
    
    def meals
        Meal.all.select {|meal| meal.waiter == self} #checking for waiter now
    end
    
    def best_tipper
        #To find the best tipper, we can write another method, #best_tipper, use the array we get from #meals, then return the customer of the meal with the highest tip:
        best_tipped_meal = meals.max { |meal_a,  meal_b| meal_a.tip <=> meal_b.tip }
        best_tipped_meal.customer
    end
end