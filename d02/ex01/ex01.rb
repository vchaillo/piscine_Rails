#!/usr/bin/env ruby -w

# This class handle html page generation
class Html
  attr_reader :page_name

  def initialize(page_name)
    @page_name = page_name
    begin
      if File.file?(page_name_html)
        raise "A file named #{page_name_html} already exist!"
      end
    end
    head
  end

  def head
    File.open(page_name_html, 'w') do |file|
      file << "<!DOCTYPE html>\n"
      file << "<html>\n"
      file << "<head>\n"
      file << "<title>#{@page_name}</title>\n"
      file << "</head>\n"
      file << "<body>\n"
    end
  end

  def dump(str)
    File.open(page_name_html, 'a+') do |file|
      begin
        msg = "There is no body tag in #{page_name_html}"
        raise msg if /<body>/.match(file.read).nil?
        file.seek 0
        msg = "Body has already been closed in #{page_name_html}"
        raise msg if %r{<\/body>} =~ file.read
      end
      file << "  <p>#{str}</p>\n"
    end
  end

  def finish
    File.open(page_name_html, 'a+') do |file|
      begin
        if %r{<\/body>} =~ file.read
          raise "#{page_name_html} has already been closed." # body ferme
        end
      end
      file << "</body>\n"
    end
  end

  private def page_name_html
    @page_name + '.html'
  end
end

if $PROGRAM_NAME == __FILE__
  a = Html.new('test')
  # a = Html.new('test')
  a.dump('Lorem_ipsum 1')
  a.dump('Lorem_ipsum 2')
  a.dump('Lorem_ipsum 3')
  a.finish
  # a.dump("Lorem_ipsum 4")
  # a.finish
end
