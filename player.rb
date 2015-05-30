require 'cards'
class Player
	attr_accessor :cards_known, :cards_possible, :rumors_passed, :rumors_answered
	# @name holds the player's in-game name as a Card object, such as: Cards::MUSTARD
	# @real_name holds the player's real name, such as: "Benji Wiebe"
	attr_reader :real_name, :player_card
	def initialize(name, real_name = nil)
		@player_card = get_card(name)
		if real_name.nil?
			@real_name = name.to_s.capitalize
		else
			@real_name = real_name
		end
		@cards_known = []
		@cards_possible = CARDS.keys
		@rumors_passed = []
		@rumors_answered = []
		@all_cards_known = false
	end
	def print_possible_cards
		print_cards(@cards_possible, "possible")
	end
	def print_known_cards
		print_cards(@cards_known, "known")
	end
	def passed_rumor(rumor)
		@cards_possible -= rumor
		if @cards_possible.length == $cards_per_player
			@cards_known = @cards_possible
			@cards_possible = []
			@all_cards_known = true
		end
	end
	def answered_rumor(rumor)
		@rumors_answered << rumor
	end
	def all_cards_known?
		return @all_cards_known 
	end
	private
	def print_cards(cardset, desc)
		puts "#{@real_name}'s #{desc} cards (#{cardset.length}):"
		cardset.each do |c|
			puts " #{c.capitalize}"
		end
		puts "---------"
		puts
	end
end
