class Card
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
		str = str.downcase
		str.gsub!(/[^a-z]/i, '')
		set = ALLCARDS if set == nil
		sym = str.to_sym
		raise InvalidCard if ! set.include? sym
		return sym
	end
end
