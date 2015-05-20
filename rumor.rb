class Rumor
	attr_reader :who, :what, :where, :all
	def initialize(str)
		str.gsub!(/[^a-z ]/i, '')
		parts = str.split
		if parts.length != 3
			raise InvalidRumorError, "Rumor must consist of three cards"
		end
		@what = nil
		@where = nil
		@who = nil
		parts.each do |p|
			s = Card.new(p)
			case s.set
				when :people
					@who = s
				when :rooms
					@where = s
				when :weapons
					@what = s
			end
		end
		if @what.nil? || @where.nil? || @who.nil?
			raise InvalidRumorError, "Missing one or more of in rumor: who, what, where"
		end
		@all = [@what,@where,@who]
	end
end
