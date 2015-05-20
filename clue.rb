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
		the_player = game.players[Card.get(reply[0], $people)]
		case reply[1]
			when "pass", "passed"
				the_player.passed_rumor(rumor)
				if the_player.all_cards_known?
					puts "Player's cards solved!"
					the_player.print_known_cards
				else
					the_player.print_possible_cards
				end
			when nil
				the_player.answered_rumor(rumor)
				break
		end
	end
end
