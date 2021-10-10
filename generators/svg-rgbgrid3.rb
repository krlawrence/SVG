#seed = ARGV[0].to_i  

puts "<html>"
puts "<body>"
puts"<svg xmlns='http://www.w3.org/2000/svg' version='1.1' width='1000' height='1000'>"

w = 50
h = 30
x = 10
y = 10

r = g = b = 0

puts "<g stroke='black'>"
#puts "<g stroke='none'>"

0.upto 16 do
  0.upto 16 do
    fill = "rgb(#{r},#{g},#{b})"
    puts "<rect x='#{x}' y='#{y}' width='#{w}' height='#{h}' fill='#{fill}'/>"
    x += w
    b += 16
  end
  x = 10
  y += h
  g += 16
  b = 0
end

puts "</g>"

puts "</svg>"
puts "</body>"
puts "</html>"               
