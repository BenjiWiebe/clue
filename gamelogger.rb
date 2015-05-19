class GameLogger
	def initialize(logfilename = "/tmp/clue.log", startmessage = "\n\n---New game---\n\n")
		@logfilename = logfilename
		@logfilehandle = File.open(@logfilename, "a")
		@logfilehandle.sync = true
		self << startmessage
	end
	def <<(t)
		@logfilehandle.write(t)
		return self
	end
end
