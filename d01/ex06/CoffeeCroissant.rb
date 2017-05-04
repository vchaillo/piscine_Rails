#!/usr/bin/env ruby -w

def coffee_croissant
	data = [
		['Frank', 33],
		['Stacy', 15],
		['Juan' , 24],
		['Dom' , 32],
		['Steve', 24],
		['Jill' , 24]
	]

	hash = Hash[data.map {|key, value| [key, value]}]
	hash = hash.sort_by{|k,v| v}.to_h
	p hash

	hash.each do |k, v|
		puts k
	end
end

if $PROGRAM_NAME == __FILE__
	coffee_croissant
end
