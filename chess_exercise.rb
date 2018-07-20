class ChessExercise
	MAX_SIZE = 8
	X_AXIS = {a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h: 8}
  PIECE_MOVES = {
  	queen: [
  		{ x: 1, y: 1},
	    { x: 1, y: 0},
	    { x: 1, y: -1},
	    { x: -1, y: 1},
	    { x: -1, y: 0},
	    { x: -1, y: -1},
	    { x: 0, y: 1},
	    { x: 0, y: -1}
  	],
  	rook: [
  		{ x: 1, y: 0},
	    { x: -1, y: 0},
	    { x: 0, y: 1},
	    { x: 0, y: -1}
  	],
  	knight: [
  		{ x: 1, y: 2},
	    { x: 2, y: 1},
	    { x: 1, y: -2},
	    { x: 2, y: -1},
	    { x: -1, y: 2},
	    { x: -2, y: 1},
	    { x: -1, y: -2},
	    { x: -2, y: -1}
  	]
  }
  STEPS = {queen: 8, rook: 8, knight: 1}
	
	def initialize(piece, pos, target=nil)
		@piece = piece.downcase.to_sym
		@position = pos.downcase
		@target = target
	end

	def possible_moves
		if valid_args?
			positions = [] 
			PIECE_MOVES[@piece].each { | step |
			  (1..STEPS[@piece]).each { |steps|
			    new_x = @x + (step[:x] * steps)
			    new_y = @y + (step[:y] * steps)
			    positions << [new_x, new_y] if new_x > 0 && new_x < 9 && new_y > 0 && new_y < 9 
			  }
			}
			positions.sort{|a,b| a[1] <=> b[1]}.collect{|position| "#{X_AXIS.key(position.first)}#{position.last}" }.join(", ")
		end
	end

	def valid_args?
		if (!PIECE_MOVES.has_key?(@piece))
		  puts "piece: #{@piece} is not valid. Please enter queen/rook/knight"
		  return false
		end
		position = @position.split('')
		@x = X_AXIS[position[0].to_sym]
		@y = position[1].to_i
		if (position.length != 2 || @x.nil? || @x < 1 || @x > MAX_SIZE || @y < 1 || @y > MAX_SIZE )
		  puts "position: #{@position} is not valid. Please enter a valid position"
		  return false
		end
		true
	end
end