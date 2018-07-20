module ChessModule
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
end