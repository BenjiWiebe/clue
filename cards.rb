CARDS = {
	hall: :room, spa: :room, theater: :room, observatory: :room, kitchen: :room, livingroom: :room, diningroom: :room, guesthall: :room,
	mustard: :people, peacock: :people, plum: :people, white: :people, scarlet: :people, green: :people,
	ax: :weapon, dumbbell: :weapon, rope: :weapon, candlestick: :weapon, pistol: :weapon, trophy: :weapon, knife: :weapon, poison: :weapon, bat: :weapon
}

def get_card(c, set = nil)
	if c.is_a? String
		c = c.to_sym
	end
	c = c.downcase
	if set.nil?
		if ! CARDS.has_key? c
			raise NameError, "Card #{c.capitalize} does not exist."
		end
	else
		if CARDS[c] != set
			raise NameError, "Card #{c.capitalize} does not exist in set #{set.capitalize}."
		end
	end
	return c
end
