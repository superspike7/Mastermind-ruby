# make a classes of player and 
module Game
  
  VALID_COLORS = ['black', 'white', 'red', 'green', 'yellow', 'blue']

  def valid?
    self.all  { |color| VALID_COLORS.any? { |valid_color| valid_color == color } 
  end

  def setColors(arr)
    arr if arr.valid?
  end

  def randomColors
    arr = []
    6.times do
      arr << VALID_COLORS.sample
    end
    arr
  end

end

class player
  def initialize(name)
    @name = name
  end
end

# make a module of the whole mechanics of the game
# write a method for the module that select an order of colors
# write a feedback/checker if the answer is in the set of colors
# write a method for the player class to select the order of colors for the computer to guess
# write a method that allows the computer to guess the set of colors proiveded by the player
# make a computer-ai diffculty of easy, mediu, and hard
# 
# 
# 
# 