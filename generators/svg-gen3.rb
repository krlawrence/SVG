mode = ARGV[0].to_i

puts "<html>"
puts "<body>"
puts"<svg xmlns='http://www.w3.org/2000/svg' version='1.1' width='500' height='500'>"

x,y=10,10
w,h=400,400

puts "<g stroke='none'>"

21.downto 1 do |i|
  fill = ( i % 2 == 0 ? "blue" : "yellow" )
  puts "<rect x='#{x}' y='#{y}' width='#{w}' height='#{h}'fill='#{fill}'/>"
  x += 10
  y += 10
  w -= 20
  h -= 20
end

puts "</g>"

puts "</svg>"
puts "</body>"
puts "</html>"  
