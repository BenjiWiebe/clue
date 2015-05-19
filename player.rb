require 'cards'
class Player
	attr_accessor :cards_known, :cards_possible, :rumors_passed, :rumors_had
	attr_reader :real_name, :name
	def initialize(name, real_name = nil)
		@name = Card.get(name, Card::PEOPLE)
		if real_name.nil?
			@real_name = @name.to_s.capitalize
		else
			@real_name = real_name
		end
		@cards_known = []
		@cards_possible = Card::ALLCARDS.dup
		@rumors_passed = []
		@rumors_had = []
	end
	def print_possible_cards
		print_cards(@cards_possible, "possible")
	end
	def print_known_cards
		print_cards(@cards_known, "known")
	end
	private
	def print_cards(cardset, desc)
		puts "#{@real_name}'s #{desc} cards (#{cardset.length}):"
		cardset.each do |c|
			puts " " + c.to_s.capitalize
		end
		puts "---------"
		puts
	end
end
