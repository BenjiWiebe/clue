class Game
	attr_reader :initial_players
	attr_accessor :players
	def initialize(names)
		@initial_players = {}
		print "Adding players: "
		names.each do |name|
			newplayer = Player.new(name)
			@initial_players[newplayer.name] = newplayer
			print newplayer.real_name + " "
		end
		@players = @initial_players.dup
		puts
		puts "#{names.count} total players."
	end
end
