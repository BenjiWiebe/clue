class Rumor
	def initialize(str)
		parts = str.split
		if parts.length != 3
			raise InvalidRumorError, "Rumor must consist of three cards"
		end
		@rumor = {}
		parts.each do |p|
			tmp = get_card(p)
			@rumor[CARDS[tmp]] = tmp
		end
		if @rumor.length < 3
			raise InvalidRumorError, "Missing one or more of in rumor: who, what, where"
		end
	end
	def partial?
		return @rumor.length < 3
	end
	def length
		return @rumor.length
	end
	def to_ary
		return @rumor.values
	end
end
