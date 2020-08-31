module Game
  
  VALID_COLORS = ['black', 'white', 'red', 'green', 'yellow', 'blue']

  def random_colors
    arr = []
    6.times do
      arr << VALID_COLORS.sample
    end
    arr
  end

   def get_code
    color_code = []
    until color_code.length == 6
      puts "color #{1 + color_code.length}:"
     color = gets.chomp.to_s
     unless VALID_COLORS.any? { |valid_color| valid_color == color }
      puts "you can only choose one of the the valid colors"
     else
      color_code << color
     end
    end
    color_code
   end


  def set_code
    puts "set your color code. This are the only valid colors: 'black', 'white', 'red', 'green', 'yellow', 'blue'"
    get_code
  end

  def player_guess
    puts "Write down your best guess. This are the only valid colors: 'black', 'white', 'red', 'green', 'yellow', 'blue'"
    get_code
  end

  def guess_checkerr(guess_code, base_code)
    feedback = guess_code.map.with_index do |color, i|
      if color == base_code[i]
        "+"
      elsif base_code.any?(color)
        "x"
      else
        "-"
      end
    end
    feedback
  end

  def smart_guess(guess, feedback) 
    smart_code = guess.map.with_index do |color, i|
      color = VALID_COLORS.sample unless feedback[i] == '+'
    end
    smart_code
  end

end




class CodeMaker
  include Game

  attr_reader :code, :mode

  def initialize(mode)
    @mode = mode
  end

  def player_mode
    @code = set_code
  end

  def bot_mode
    @code = random_colors
  end

end


class CodeBreaker
  include Game

  attr_reader :mode, :guess_count, :guess_code

  def initialize(mode)
    @mode = mode
    @guess_count = 12
  end

  def guess
   @guess_code = player_guess
  end

  def bot_guess
    @guess_code = random_colors
  end

  def smart_bot
    @guess_code = smart_guess
end




include Game

puts "do you want to be (1)Codemaker? or (2)Codebreaker?"
choice = gets.chomp.to_i
if choice == 1
  puts "you choosed to be Codemaker"
  player = CodeMaker.new('player')
  bot = CodeBreaker.new('bot')
  bot.bot_guess
  player.player_mode
  puts "your code is '#{player.code.join('-')}'"
  option1 = true
elsif choice == 2
  puts "you choosed to be Codebreaker"
  bot = CodeMaker.new('bot')
  player = CodeBreaker.new('player')
  bot.bot_mode
  puts "bot has set his code, start guessing now"
  option2 = true
else 
  puts "you can only choose (1) or (2)"
end


round = 0

# while option1

#   guess = bot.guess_code
#   base = player.code
#   feedback = Game::guess_checkerr(guess, base)

#   puts "guess ##{round + 1}"
#   puts "bot guessed: '#{guess.join('-')}'"
#   puts "status: '#{feedback.join('|')}'"

#   round += 1
#   if guess == base
#     puts "bot wins! he successfully guessed your code!"
#     break 
#   elsif round == 12
#     puts "bot lose! ran out of guesses"
#     break
#   end


#   puts "bot is thinking..."
#   sleep 2
#   puts "..."

# end


# while option2

#   guess = player.guess
#   base = bot.code
#   feedback = Game.guess_checker(guess, base)

#   puts "guess ##{round + 1}"
#   puts "player guessed: '#{guess.join('-')}'"
#   puts "status: '#{feedback.join('|')}'"

#   round += 1
#   if guess == base
#     puts "player wins! he successfully guessed bot's code!"
#     break 
#   elsif round == 12
#     puts "the correct code is: #{base.join('-')}"
#     puts "player lose! ran out of guesses"
#     break
#   end

end # end
