require 'spec_helper'
require_relative '../chess_exercise'
 
describe 'Chess' do
	context "valid piece and position" do
		it "should return the psiible moves" do
		  lib = ChessExercise.new('knight', 'd2')
		  expect(lib.possible_moves).to eq "b1, f1, f3, b3, c4, e4"
		end
	end
	context "minimum steps to reach distent tile" do
		it "should return the least number of moves to reach distent tile." do
		  lib = ChessExercise.new('knight', 'd2')
		  lib.instance_variable_set(:@random_positions, [])
		  expect(lib.distant_tile).to eq 6
		end
	end
end
