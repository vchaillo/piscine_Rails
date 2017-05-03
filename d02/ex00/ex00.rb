#!/usr/bin/env ruby -w
class Html
	attr_reader :page_name

	def initialize(page_name)
		@page_name = page_name + ".html"
		head
	end

	def head
		open(@page_name, 'w') do |file|
		  file << "<!DOCTYPE html>\n"
		  file << "<html>\n"
		  file << "<head>\n"
		  file << "<title>#{@page_name}</title>\n"
		  file << "</head>\n"
		  file << "<body>\n"
		end
	end

	def dump(str)
		open(@page_name, 'a') do |file|
			file << "  <p>#{str}</p>\n"
		end
	end

	def finish
		open(@page_name, 'a') do |file|
			file << "</body>\n"
		end
	end
end

if $PROGRAM_NAME == __FILE__
	a = Html.new("test")
	10.times{|x| a.dump("titi_number#{x}")}
	a.finish
end
