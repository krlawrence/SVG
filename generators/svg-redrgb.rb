puts "<html>"
puts "<head>"
puts "<meta name='description' content='Machine generated SVG using a Ruby script.' />"
puts "<meta name='author' content='Kelvin R. Lawrence' />"
puts "</head>"
puts "<body>"
puts"<svg xmlns='http://www.w3.org/2000/svg' version='1.1' width='2000' height='1000'>"

w = 3
h = 150
x = 10
y = 0

g = b = 0

puts "<g stroke='none'>"

1.upto 255 do |r|
  fill = "rgb(#{r},#{g},#{b})"
  puts "<rect x='#{x}' y='#{y}' width='#{w}' height='#{h}' fill='#{fill}'/>"
  x += w
end

puts "</g>"

puts "</svg>"
puts "</body>"
puts "</html>"     
