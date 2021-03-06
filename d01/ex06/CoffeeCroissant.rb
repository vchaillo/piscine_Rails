#!/usr/bin/env ruby -w

def coffee_croissant
  data = [['Frank', 33], ['Stacy', 15], ['Juan', 24], ['Dom', 32],
          ['Steve', 24], ['Jill', 24]]

  doubles = {}
  data = data.sort_by { |_k, v| v }
  data.each { |k, v| doubles[v].nil? ? doubles[v] = [k] : doubles[v] << k }
  doubles.each { |_k, v| puts v.sort }
end

coffee_croissant if $PROGRAM_NAME == __FILE__
