class Rumor
	attr_reader :who, :what, :where, :all
	def initialize(str)
		str.gsub!(/[^a-z ]/i, '')
		parts = str.split
		if parts.length != 3
			raise InvalidRumor
		end
		@what = nil
		@where = nil
		@who = nil
		parts.each do |p|
			s = str2sym(p)
			if $people.include? s
				@who = s
			elsif $rooms.include? s
				@where = s
			elsif $weapons.include? s
				@what = s
			else
				raise InvalidCard
			end
		end
		if @what.nil? || @where.nil? || @who.nil?
			raise InvalidRumor
		end
		@all = [@what,@where,@who]
	end
end
