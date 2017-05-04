#!/usr/bin/env ruby -w

def css
  file = open('periodic_table.css', 'w')
  file << "body {\n"
  file << "	font-family: sans-serif;\n"
  file << "	background-color: #222;\n"
  file << "	color: #fff;\n"
  file << "}\n"
  file << "table\n"
  file << "{\n"
  file << "	width: 100%;\n"
  file << "	margin: auto;\n"
  file << "	border-spacing: 5px;\n"
  file << "}\n"
  file << "td \n"
  file << "{\n"
  file << "	width: 5.555555%;\n"
  file << "	border: none;\n"
  file << "}\n"
  file << "td.void\n"
  file << "{\n"
  file << "	background-color: inherit;\n"
  file << "}\n"
  file << "tr.void\n"
  file << "{\n"
  file << "	height: 20px;\n"
  file << "}\n"
  file << "ul\n"
  file << "{\n"
  file << "	list-style: none;\n"
  file << "	margin: 0;\n"
  file << "	padding: 0;\n"
  file << "}\n"
  file << ".M\n"
  file << "{\n"
  file << "	font-size: 0.7vw;\n"
  file << "	text-align: center;\n"
  file << "	margin-right: 3px;\n"
  file << "	margin-top: 3px;\n"
  file << "}\n"
  file << ".Symbol\n"
  file << "{\n"
  file << "	font-size:1.5vw;\n"
  file << "	text-align: center;\n"
  file << "	font-weight: bold;\n"
  file << "}\n"
  file << ".Name\n"
  file << "{\n"
  file << "	font-size: 0.7vw;\n"
  file << "	text-align: center;\n"
  file << "}\n"
  file << ".Z\n"
  file << "{\n"
  file << "	font-size: 0.8vw;\n"
  file << "	text-align: center;\n"
  file << "	margin-top: 3px;\n"
  file << "	margin-left: 3px;\n"
  file << "}\n"
  file << "h1\n"
  file << "{\n"
  file << "	text-align: center;\n"
  file << "}\n"
  file << "h4\n"
  file << "{\n"
  file << "	margin: 5px auto auto;\n"
  file << "	font-weight: normal;\n"
  file << "}\n"
  file << "h3\n"
  file << "{\n"
  file << "	text-align: center;\n"
  file << "	margin: 2% auto;\n"
  file << "}\n"
  file << "p\n"
  file << "{\n"
  file << "	text-align: center;\n"
  file << "	width: 60%;\n"
  file << "	margin: 2% auto;\n"
  file << "}\n"
  file << "img\n"
  file << "{\n"
  file << "	width: 20%;\n"
  file << "	margin: 2% auto;\n"
  file << "	display: block;\n"
  file << "}\n"
  file << ".l_orange {\n"
  file << "	background-color: #F7AE4C;\n"
  file << "}\n"
  file << ".red {\n"
  file << "	background-color: #F82C24;\n"
  file << "}\n"
  file << ".purple {\n"
  file << "	background-color: #63328B;\n"
  file << "}\n"
  file << ".blue {\n"
  file << "	background-color: #2D3B90;\n"
  file << "}\n"
  file << ".yellow {\n"
  file << "	background-color: #F7E947;\n"
  file << "	color: #444;\n"
  file << "}\n"
  file << ".orange {\n"
  file << "	background-color: #F15B31;\n"
  file << "}\n"
  file << ".green {\n"
  file << "	background-color: #8CC348;\n"
  file << "}\n"
  file << ".l_blue {\n"
  file << "	background-color: #31AADC;\n"
  file << "}\n"
  file << "#background {\n"
  file << "	position: fixed;\n"
  file << "	top: 0;\n"
  file << "	left: 0;\n"
  file << "	z-index: -42;\n"
  file << "	width: 100%;\n"
  file << "	height: 100%;\n"
  file << '	background: url(\'https://www.walldevil.com/wallpapers/a66/'
  file << "perforated-fabric-texture.jpg');\n"
  file << "	background-size: cover;\n"
  file << "	background-repeat: no-repeat;\n"
  file << "	background-position: center;\n"
  # file << "	filter:blur(15px);\n"
  # file << "	-webkit-filter: blur(15px);\n"
  file << "}\n"
  file.close
end

def head(file)
  file << "<!DOCTYPE html>\n"
  file << "<html>\n"
  file << "<head>\n"
  file << "<title>Periodic Table</title>\n"
  file << '<meta http-equiv=\"Content-Type\" '
  file << "content=\"text/html; charset=UTF-8\" />\n"
  file << '<link rel=\"stylesheet\" type=\"text/css\" '
  file << "href=\"periodic_table.css\">\n"
  css
  file << "</head>\n"
  file << "<body>\n"
  file << "<div id=\"background\"></div>\n"
  file << "<table>\n"
end

def finish(file)
  file << "</table>\n</body>\n</html>\n"
end

def create_elem(line)
  { name: line.split[0], position: line.split(',')[0].split(':')[1],
    number: line.split(',')[1].split(':')[1],
    small: line.split(',')[2].split(':')[1].strip,
    molar: line.split(',')[3].split(':')[1],
    electrons: line.split(',')[4].split(':')[1] }
end

def get_color(elem)
  return 'l_orange' if [1, 6, 7, 8, 15, 16, 34].include?(elem[:number].to_i)
  return 'red' if [2, 10, 18, 36, 54, 86, 118].include?(elem[:number].to_i)
  return 'purple' if [3, 11, 19, 37, 55, 87].include?(elem[:number].to_i)
  return 'blue' if [4, 12, 20, 38, 56, 88].include?(elem[:number].to_i)
  return 'yellow' if [5, 14, 32, 33, 51, 52].include?(elem[:number].to_i)
  return 'orange' if [9, 17, 35, 53, 85, 117].include?(elem[:number].to_i)
  return 'green' if [13, 31, 49, 50, 81, 82, 83, 84, 113, 114, 115, 116].include?(elem[:number].to_i)
  return 'l_blue' if (Array(21..30) + Array(39..48) + Array(72..80) + Array(104..112)).include?(elem[:number].to_i)
end

def create_case(file, elem)
  color = get_color(elem)
  file << "<td class=\"#{color}\">\n"
  file << "	<h4 class=\"Name\">#{elem[:name]}</h4>\n"
  file << "	<ul>\n"
  file << "		<li class=\"Symbol\">\n"
  file << "			#{elem[:small]}\n"
  file << "		</li>\n"
  file << "		<li class=\"M\">\n"
  file << "			#{elem[:molar]}\n"
  file << "		</li>\n"
  file << "		<li class=\"Z\">\n"
  file << "			#{elem[:number]}\n"
  file << "		</li>\n"
  file << "	</ul>\n"
  file << "</td>\n"
end

def elm
  file = open('periodic_table.txt', 'r')
  html = open('periodic_table.html', 'w')
  head(html)

  prev_position = 0
  file.each do |line|
    elem = create_elem(line)
    html << "<tr>\n" if elem[:position].to_i.zero?
    if elem[:position].to_i > prev_position + 1
      offset = elem[:position].to_i - (prev_position + 1)
      html << "<td class=\"void\" colspan=\"#{offset}\"></td>\n"
    end
    create_case(html, elem)
    prev_position = elem[:position].to_i
    html << "</tr>\n" if elem[:position].to_i == 17
  end
  finish(html)
  html.close
  file.close
end

elm if $PROGRAM_NAME == __FILE__
