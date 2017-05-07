#!/usr/bin/env ruby -w

# This class manage Dup_file Exceptions
class Dup_file < StandardError
  def initialize(file)
    @file = file
    @path = "#{Dir.pwd}/#{@file}.html"
  end

  def show_state
    puts "A file named #{@file} was already there: #{@path}"
  end

  def correct
    @file += '.new'
    @path = "#{Dir.pwd}/#{@file}.html"
    correct if File.file?(@path)
    return @file
  end

  def explain
    puts "Appended .new in order to create requested file: #{@path}"
  end
end

# This class manage Body_closed Exceptions
class Body_closed < StandardError
  def initialize(file)
    @file = file
    @path = "#{Dir.pwd}/#{@file}.html"
  end

  def show_state
    puts "In #{@file} body was closed :"
  end

  def correct(str)
    lines = File.readlines(@path)
    @line_nb = lines.index("</body>\n")
    @line_content = lines[@line_nb]
    lines.delete_at(@line_nb)
    File.open(@path, 'w') do |file|
      file << lines.join << "  <p>#{str}</p>\n" << "</body>\n"
    end
  end

  def explain
    print "> ln :#{@line_nb + 1} #{@line_content.strip} : "
    puts 'text has been inserted and tag moved at the end of it.'
  end
end

# This class handle html page generation
class Html
  attr_reader :page_name

  def initialize(page_name)
    @page_name = page_name
    begin
      raise Dup_file, page_name if File.file?(page_name_html)
    rescue Dup_file => error
      error.show_state
      @page_name = error.correct
      error.explain
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
      # begin
      # end

      begin
        msg = "There is no body tag in #{page_name_html}"
        raise msg if /<body>/.match(file.read).nil?
        file.seek 0
        raise Body_closed, @page_name if %r{<\/body>} =~ file.read
        file << "  <p>#{str}</p>\n"
      rescue Body_closed => error
        error.show_state
        error.correct(str)
        error.explain
      end
    end
  end

  def finish
    File.open(page_name_html, 'a+') do |file|
      begin
        if %r{<\/body>} =~ file.read
          raise "#{page_name_html} has already been closed."
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
  a.dump('Lorem_ipsum after body closed 1')
  a.dump('Lorem_ipsum after body closed 2')
  a.dump('Lorem_ipsum after body closed 3')
  # a.finish
end
