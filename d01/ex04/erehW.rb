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

def erehw
  return unless ARGV.count == 1
  capital = capitals_cities.key(ARGV.first)
  if capital
    puts states.key(capital)
  else
    puts 'Unknown capital city'
  end
end

erehw if $PROGRAM_NAME == __FILE__
