require 'spec_helper'
require_relative '../chess_exercise'
 
describe 'Chess' do
	context "valid piece and position" do
		it "should return the psiible moves" do
		  lib = ChessExercise.new('knight', 'd2')
		  expect(lib.possible_moves).to eq "f1, b1, f3, b3, e4, c4"
		end
	end
end
