require 'rubygems'
require 'optparse'
require './chess_exercise'

class Chess
  def self.parse(args)
    options = {}
    opts = OptionParser.new do |opts|
      opts.banner = "Usage: piece"
      
      opts.on('--piece PIECE', 'Chess piece name') do |piece|
  		options[:piece] = piece
      end

      opts.on('--position POSITION', 'The position of piece on chess board') do |position|
        options[:position] = position
      end

      opts.on('--target TARGET', Array, 'List of target positions') do |target|
        options[:target] = target.map { |v| v.strip }
      end
    
    end

    begin
      opts.parse(args)
    rescue Exception => e
      puts "Exception encountered: #{e}"
      exit 1
    end

    options
  end
end
#puts ARGV
options = Chess.parse(ARGV)

raise "options missing --piece, --position use --help for more information" if options[:piece].nil? && options[:position].nil?

if options[:piece] && options[:position]
	puts ChessExercise.new(options[:piece], options[:position]).possible_moves
end
