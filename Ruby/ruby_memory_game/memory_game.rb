class MemoryGame
	def initialize
		@questions = []
	end

	def questions
		@questions.length
	end

	def enter_question(question, answer)
		@questions << QuestionAnswerPair.new(question, answer)
	end

	def current_question
		@current_question = @questions.pop
		@current_question.question
	end

	def answer_question(answer)
		@current_question.answer.downcase == answer.downcase
	end

	def welcome
		puts "Welcome to the game!"
	end

	def option_to_enter_new_question
		puts "Enter '1' to add to the quiz"
		puts "Enter '2' to take the quiz >"
	end

	def capture_answer
		input = $stdin.gets.chomp
		if input == "1"
			puts "Great, please enter your question here >"
			enter_question("test", "test")
		elsif input == "2"
			puts "Cool, let me test you then!"
		else
			puts "I don't know what you mean, please try again"
		end
		input
	end
end

QuestionAnswerPair = Struct.new(:question, :answer)

game = MemoryGame.new
game.welcome
game.option_to_enter_new_question
game.capture_answer
