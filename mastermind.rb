# frozen_string_literal: true

def generate_code
  code_values = %w[w b r y p]
  code = []
  4.times { code.append(code_values.sample) }
  code
end

def play_game(turns)
  code = generate_code
  puts code
  
  while turns > 0
    puts ("You have #{turns} turns left")
    if check_match(code)
      puts 'You won!'
      break
    else
      turns -= 1
    end  

    if turns == 0
      puts "You Lost! The code was #{code}"
    end
  end
end

def check_match(match_with)
  correct_colors = 0
  correct_spots_and_colors = 0

  guess = gets.chomp.split(',')
  match_with.each_with_index { |color, index|
    if guess[index] == color
      correct_spots_and_colors += 1
    end
  }
  match_with.uniq.each{|unique_color|
    if guess.include? unique_color
      correct_colors +=1
    end
  }
  return true if correct_spots_and_colors == 4
  
  puts "you got #{correct_colors} correct colors and #{correct_spots_and_colors} correct spots"
end
puts "Welcome to Mastermind! syntax:<color,color,color,color> where color can be w, r, b, y or p"
play_game(10)
