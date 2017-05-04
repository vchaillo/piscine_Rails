#!/usr/bin/env ruby -w

def where
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
		state = states[ARGV.first]
		if state
			puts capitals_cities[state]
		else
			puts 'Unknown state'
		end
	end
end

if $PROGRAM_NAME == __FILE__
	where
end
