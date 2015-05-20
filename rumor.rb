class Rumor
	attr_reader :who, :what, :where, :all
	def initialize(str)
		str.gsub!(/[^a-z ]/i, '')
		parts = str.split
		if parts.length != 3
			raise InvalidRumorError
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
				else
					raise InvalidCardError
			end
		end
		if @what.nil? || @where.nil? || @who.nil?
			raise InvalidRumorError
		end
		@all = [@what,@where,@who]
	end
end
