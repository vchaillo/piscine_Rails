#!/usr/bin/env ruby -w

def coffee_croissant
  data = [['Frank', 33], ['Stacy', 15], ['Juan', 24], ['Dom', 32],
          ['Steve', 24], ['Jill', 24]]

  hash = Hash[data.map { |key, value| [key, value] }]
  hash = hash.sort_by { |_k, v| v }.to_h
  p hash

  hash.each do |k, _v|
    puts k
  end
  p 'Still have to sort by name when same age'
end

coffee_croissant if $PROGRAM_NAME == __FILE__
