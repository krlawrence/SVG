# makeindex.rb
#
# This simple script produces a list of links to all SVG files found
# along a specified search path.

files = Dir["*.html"]
files += Dir["*.svg"]
files.sort!
puts "<html>"
puts "<h3>Some sample (machine and hand generated) SVG</H3>"
puts "<p>Most are HTML with SVG embedded. Entries that show a .svg extension are stand alone SVG files.</p>"
puts "<head>"
puts " <style type='text/css'>"
puts "a:active { color: white; text-decoration: none;  background:darkblue }"
puts "a:visited { color: #009; text-decoration: none;  }"
puts "a:hover { color: white; text-decoration: none;  background:darkblue }"
puts "a { text-decoration:none; color:blue; }"
puts "</style>" 
puts " "
puts "<script>"
puts "  var oldobj = null; "
puts " "
puts "  function sel(obj)"
puts "  {"
puts "    if (oldobj != null)"
puts "    {"
puts "      oldobj.style.background = '' ;"
puts "    }"
puts "    obj.style.background='lightblue' ;"
puts "    oldobj = obj;"
puts "  }"
puts "</script>"
puts "</head>"
puts "<body>"
puts "<ol>"
n = 0
files.each do |f|
  if f == "index.html" or f == "index2.html" 
    next
  end
  tmp = f.gsub(".html","")
  puts "<li><a onclick='sel(this)' href=\./#{f} target='canvas_frame'\>#{tmp}</a></li>" 
end
 
puts "</ol>"
puts "</body>"
puts "</html>" 


