# words = [
# 	"dog",
# 	"cats", 
# 	"fast"
# ]

# secret_word = words.sample
# puts "The secret word is #{secret_word}"
# board = ["_"] * secret_word.size
# puts board.join(" ")



# lives = 7 

# while lives > 0 && board.include?("_") 
# 	print "You have #{lives} left. Please guess the secret letter: "
# 	guess = gets.chomp
# 	puts "Your guess was #{guess}"

# 	if secret_word.include?(guess)

# 		secret_word.chars.each_with_index do |c, index|
# 			if c == guess
# 				board[index] = c
# 			end
# 		end
# 	else
# 		lives -= 1
# 		puts "The word did not include: #{guess}"
# 	end
# 	p board.join(" ")
# end 


# puts "The word was: #{secret_word}"

# #21:13

# Object Oriented version

class Hangman

	attr_reader :lives
	attr_accessor :lives

	attr_reader :board
	attr_reader :secret_word

	def initialize
		@lives = 7 
		@secret_word = word_list.sample
	 	@board = setup_board 
	
	end

	def setup_board 
		# @board = ["_"] * secret_word.size
		["_"] * secret_word.size
	end

	def word_list 
		["dog", "cat", "fast"]
	end

	# def secret_word
	# 	@secret_word
	# end

	def start
		puts "Welcome to Hangman"
		# While the player has lives and has not won

		while !lost? && !won?
			# Print the nynber of lives left after play
			puts "\n\nYou have number of #{lives} lives left"
			# Print the board state
			puts board_state
				# Receive a guess
			guess = make_guess
				# Update the board
			update_board(guess)
		end	

	  if won? 
			puts "You won!"
		else 
			puts "You lost!" 
		end

	end

	def won?
		board.join("") == secret_word
	end

	def lost? 
		lives <= 0
	end

	def make_guess
		print "Please guess a letter: "
		gets.chomp
	
	end


	def board_state
		board.join(" ")
	end

	def update_board(guess)
		if secret_word.include?(guess)
			i = 0 
			while i < secret_word.size
					if guess.downcase == secret_word[i].downcase
						board[i] = secret_word[i]
					end
					i += 1
			end
		else  
			self.lives -= 1
		end
	end
	
end

game = Hangman.new
game.start
