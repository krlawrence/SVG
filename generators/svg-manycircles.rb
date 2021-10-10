puts "<html>"
puts "<head>"
puts "<meta name='description' content='Machine generated SVG using a Ruby script.' />"
puts "<meta name='author' content='Kelvin R. Lawrence' />"
puts "<meta name='created' content='#{Time.now}' />"
puts "</head>"
puts "<body>"
puts"<svg xmlns='http://www.w3.org/2000/svg' version='1.1' width='2000' height='1000'>"

rad  = 255
cx   = 300
cy   = 300

r = b = 0

puts "<g stroke='none'>"

#255.downto 1 do |g|
1.upto 255 do |g|
  #fill = "rgb(#{r},#{g},#{b})"
  fill = "rgb(#{r},#{g},#{g})"
  puts "<circle cx='#{cx}' cy='#{cy}' r='#{rad}' fill='#{fill}'/>"
  rad -= 1
end

puts "</g>"

puts "</svg>"
puts "</body>"
puts "</html>" 
