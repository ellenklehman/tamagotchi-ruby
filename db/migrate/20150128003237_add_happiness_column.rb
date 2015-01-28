class AddHappinessColumn < ActiveRecord::Migration
  def change
    add_column :tamagotchis, :happiness, :integer
  end
end
