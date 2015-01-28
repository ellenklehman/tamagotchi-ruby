class Tamagotchi < ActiveRecord::Base
  validates_presence_of(:sleep_level, :food_level, :activity_level)
  before_create(:set_levels)


  def time_passes
    self.update!({sleep_level: (sleep_level - 1),
                  activity_level: (activity_level - 1),
                  food_level: (food_level - 1)})
  end

  def is_alive
    food_level > 0
  end

  def happiness
    (activity_level + food_level + sleep_level)/3
  end

  def play
    self.update!({activity_level: (activity_level + 1)})
  end

  def feed
    self.update({food_level: (food_level + 1)})
  end

  def sleep_time
    self.update({sleep_level: (sleep_level + 1)})
  end

private
  def set_levels
    self.sleep_level = 10
    self.food_level = 10
    self.activity_level = 10
  end
end
