#!/usr/bin/env ruby -w

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

def where
  return unless ARGV.count == 1
  state = states[ARGV.first]
  if state
    puts capitals_cities[state]
  else
    puts 'Unknown state'
  end
end

where if $PROGRAM_NAME == __FILE__
