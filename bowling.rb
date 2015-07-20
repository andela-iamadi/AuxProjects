class Bowling
  attr_reader :score
	def initialize
		@score = 0
		@score_text = "";
	end

	public

	def hit(hit_value)
		@score += hit_value.to_i
	end

	def score_text
		@score_text = "You scored #{@score} points"
		return @score_text
	end

end

bowl = Bowling.new
bowl.hit(123)
puts bowl.score_text
puts bowl.score