class ChessExercise
	require './lib/chess_module'
	include ChessModule
	
	def initialize(piece, pos, target=false)
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

	def distant_tile
		if valid_args?
			@target_position = get_distant_target_position
			@random_positions = (1..8).to_a.product((1..8).to_a).sample(8).map{ |x,y| [x,y] } if @target
			moves = get_moves(@x, @y)
			count = min_moves_to_reach(moves, 1)
			count
		end
	end

	def min_moves_to_reach(moves, count=1, parent_moves = nil)
		reached = false
		count = count
		new_moves = []
		if moves.include? @target_position || !(moves & @random_positions).empty?
			reached = true
			puts "Move encountered one of the random positions #{moves} --- #{@random_positions}"
		end
		unless reached
			moves.each do |move|
				child_moves = get_moves(move.first, move.last)
				unless (child_moves & @random_positions).empty?
					puts "Move encountered one of the random positions #{child_moves} --- #{@random_positions}"
					reached = true
					break
				end
	  		if child_moves.include? @target_position
					reached = true
					break
				else
					new_moves << child_moves.first
				end
			end
			count += 1
		end
		return count if reached == true
		min_moves_to_reach(new_moves, count, moves)
  end

  def get_moves(x,y)
  	moves = []
  	PIECE_MOVES[@piece].each do | step |
		  (1..STEPS[@piece]).each do |steps|
		    new_x = x + (step[:x] * steps)
		    new_y = y + (step[:y] * steps)
		    moves << [new_x, new_y] if new_x > 0 && new_x < 9 && new_y > 0 && new_y < 9 
		  end
		end
		moves
  end

	def get_distant_target_position
		if @x.between?(1,4) && @y.between?(1,4)
      [8,8]
		elsif @x.between?(1,4) && @y.between?(5,8)
			[8,1]
		elsif @x.between?(5,8) && @y.between?(1,4)
			[1,8]
		elsif @x.between?(5,8) && @y.between?(5,8)
			[1,1]
		end
	end
end