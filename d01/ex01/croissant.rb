#!/usr/bin/env ruby -w

def croissant
	file = open('numbers.txt', 'r').read
	array = file.split(',').map(&:to_i)
	puts array.sort
end

if $PROGRAM_NAME == __FILE__
	croissant
end
