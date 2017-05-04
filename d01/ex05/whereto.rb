#!/usr/bin/env ruby -w

def get_hash(arg, states, capitals_cities)
	capital = capitals_cities.key(arg.split.map(&:capitalize).join(' '))
	hash = {state: states.key(capital), capital: arg, key: capital} if capital
	state = states[arg.split.map(&:capitalize).join(' ')]
	hash = {state: arg, capital: capitals_cities[state], key: state} if state
	return !hash.nil? ? hash : nil
end

def whereto
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
		args = ARGV.first.split(',').map(&:strip)
		args.each do |arg|
			# hash = erehw(arg, states, capitals_cities)
			# hash = where(arg, states, capitals_cities) if hash.nil?
			hash = get_hash(arg, states, capitals_cities)
			puts "#{arg} is neither a capital city nor a state" if !arg.empty? && hash.nil?
			puts "#{hash[:capital]} is the capital of #{hash[:state]} (akr: #{hash[:key]})" if hash
		end
	end
end

if $PROGRAM_NAME == __FILE__
	whereto
end
