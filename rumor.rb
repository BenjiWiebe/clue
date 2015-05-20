class Rumor
	def initialize(str)
		parts = str.split
		if parts.length != 3
			raise InvalidRumorError, "Rumor must consist of three cards"
		end
		@rumor = {}
		sets_not_included = [:people, :rooms, :weapons]
		parts.each do |p|
			s = Card.new(p)
			@rumor[s.set] = s
			sets_not_included -= [s.set]
		end
		if sets_not_included.length > 0
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
