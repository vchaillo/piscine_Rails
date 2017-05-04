#!/usr/bin/env ruby -w

def get_hash(arg, states, capitals_cities)
  capital = capitals_cities.key(arg.split.map(&:capitalize).join(' '))
  return { state: states.key(capital), capital: arg, key: capital } if capital
  state = states[arg.split.map(&:capitalize).join(' ')]
  return { state: arg, capital: capitals_cities[state], key: state } if state
  # return !hash.nil? ? hash : nil
end

def states
  {
    'Oregon' => 'OR',
    'Alabama' => 'AL',
    'New Jersey' => 'NJ',
    'Colorado' => 'CO'
  }
end

def capitals_cities
  {
    'OR' => 'Salem',
    'AL' => 'Montgomery',
    'NJ' => 'Trenton',
    'CO' => 'Denver'
  }
end

def get_str(arg)
  hash = get_hash(arg, states, capitals_cities)
  if !arg.empty? && hash.nil?
    puts "#{arg} is neither a capital city nor a state"
  elsif hash
    print "#{hash[:capital]} is the capital of #{hash[:state]} "
    puts "(akr: #{hash[:key]})"
  end
end

def whereto
  return unless ARGV.count == 1
  args = ARGV.first.split(',').map(&:strip)
  args.each do |arg|
    str = get_str(arg)
    puts str if str
  end
end

whereto if $PROGRAM_NAME == __FILE__
