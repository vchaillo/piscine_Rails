#!/usr/bin/env ruby -w

def erehw
	states = {
		"Oregon" => "OR",
		"Alabama" => "AL",
		"New Jersey" => "NJ",
		"Colorado" => "CO"
	}
	capitals_cities = {
		"OR" => "Salem",
		"AL" => "Montgomery",
		"NJ" => "Trenton",
		"CO" => "Denver"
	}

	if ARGV.count == 1
		capital = capitals_cities.key(ARGV.first)
		if capital
			puts states.key(capital)
		else
			puts 'Unknown capital city'
		end
	end
end

if $PROGRAM_NAME == __FILE__
	erehw
end
