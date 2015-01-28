require("spec_helper")

describe Tamagotchi do
  describe("#initialize") do
    it { should validate_presence_of(:food_level) }
    it { should validate_presence_of(:sleep_level) }
    it { should validate_presence_of(:activity_level) }
  end

  describe("#set_levels") do
    it("sets the values of the tamagotchis attributes") do
      my_pet = Tamagotchi.new({name: "lil dragon"})
      expect(my_pet.food_level()).to(eq(10))
    end
  end

  describe("#time_passes") do
    it("decreases the amount of food the Tamagotchi has left by 1") do
      my_pet = Tamagotchi.new({name: "lil dragon"})
      my_pet.time_passes()
      expect(my_pet.food_level()).to(eq(9))
    end
  end

  describe("#is_alive") do
    it("is alive if the food level is above 0") do
      my_pet = Tamagotchi.new({name: "lil dragon"})
      expect(my_pet.is_alive()).to(eq(true))
    end

    it("is dead if the food level is 0") do
      my_pet = Tamagotchi.new({name: "lil dragon"})
      my_pet.food_level = 0
      expect(my_pet.is_alive()).to(eq(false))
    end
  end

  describe("#happiness") do
    it "determines the happiness level of the pet" do
      my_pet = Tamagotchi.new({name: "lil dragon"})
      expect(my_pet.happiness()).to(eq(10))
    end
  end


  describe("#play") do
    it "increases the activity_level" do
      my_pet = Tamagotchi.new({name: "lil dragon"})
      my_pet.time_passes()
      my_pet.time_passes()
      my_pet.play()
      my_pet.play()
      expect(my_pet.happiness()).to(eq(8))
    end
  end

  describe("#feed") do
    it "increases the food level of the pet" do
      my_pet = Tamagotchi.new({name: "lil dragon"})
      my_pet.time_passes()
      my_pet.time_passes()
      my_pet.feed()
      my_pet.feed()
      expect(my_pet.happiness()).to(eq(8))
    end
  end

  describe("#sleep_time") do
    it "increases the sleep level of the pet" do
      my_pet = Tamagotchi.new({name: "lil dragon"})
      my_pet.time_passes()
      my_pet.time_passes()
      my_pet.sleep_time()
      my_pet.sleep_time()
      expect(my_pet.happiness()).to(eq(8))
    end
  end
end
