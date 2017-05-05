#!/usr/bin/env ruby -w

def croissant
  puts open('numbers.txt', 'r').read.split(',').map(&:to_i).sort
end

croissant if $PROGRAM_NAME == __FILE__
