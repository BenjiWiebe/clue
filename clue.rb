#!/usr/bin/ruby -I.

require 'game'
require 'exceptions'
require 'player'
require 'rumor'
require 'cards'
require 'gamelogger'

names = ["mustard","green","white","peacock","scarlet","plum"]
game = Game.new(names)
$logger = GameLogger.new

def get_input(reason = nil)
	s = gets.chomp
	unless reason.nil?
		#$logger << reason << ": "
	end
	$logger << s << "\n"
	return s
end

loop do
	print "Enter a rumor: "
	rumor = Rumor.new(get_input("rumor"))
	loop do
		print "> "
		reply = get_input.downcase.split
		the_player = game.players[str2sym(reply[0], $people)]
		case reply[1]
			when "pass", "passed"
				the_player.cards_possible -= rumor.all
				if the_player.cards_possible.length == 3
					the_player.cards_known = the_player.cards_possible.dup
					puts "Player's cards solved!"
					the_player.print_known_cards
				end
				the_player.print_possible_cards unless the_player.cards_known.length == 3
			when nil
				break
		end
	end
end
