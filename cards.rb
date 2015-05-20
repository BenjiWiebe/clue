class Card
	attr_reader :set
	PEOPLE = [:mustard, :peacock, :plum, :white, :scarlet, :green] # Complete
	WEAPONS = [:ax, :dumbbell, :rope, :candlestick, :pistol, :trophy, :knife, :poison]
	ROOMS = [:hall, :spa, :pool, :theater, :observatory, :kitchen, :livingroom, :diningroom, :guesthall] # pool??
	ALLCARDS = WEAPONS + PEOPLE + ROOMS
	def initialize(str)
		@card = Card.get(str)
		if WEAPONS.include? @card
			@set = :weapons
		elsif PEOPLE.include? @card
			@set = :people
		elsif ROOMS.include? @card
			@set = :rooms
		end
	end
	def self.get(str, set = nil)
		set = ALLCARDS if set == nil
		if str.is_a? String
			str = str.downcase
			str.gsub!(/[^a-z]/i, '')
			sym = str.to_sym
		else
			sym = str
		end
		raise InvalidCardError, "Card #{str} does not exist" if ! set.include? sym
		return sym
	end
	def desc
		return @card.to_s.capitalize
	end
	def ==(c)
		return c.class == self.class && c.hash == self.hash
	end
	def hash
		return [@card, @set].hash
	end
end
