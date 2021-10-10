mode = ARGV[0].to_i

puts "<html>"
puts "<body>"
puts"<svg xmlns='http://www.w3.org/2000/svg' version='1.1' width='1000' height='1000'>"

w = 50
h = 30
x = 10
y = 10

puts "<g stroke='black'>"

0.upto 16 do |j|
  0.upto 16 do |i|
    fill = "rgb(#{rand(255)},#{rand(255)},#{rand(255)})"
    puts "<rect x='#{x}' y='#{y}' width='#{w}' height='#{h}' fill='#{fill}'/>"
    x += w
  end
  x = 10
  y += h
end

puts "</g>"

puts "</svg>"
puts "</body>"
puts "</html>"         
