
#seed = ARGV[0].to_i  

puts "<html>"
puts "<head>"
puts "<meta name='description' content='Machine generated SVG using a Ruby script.' />"
puts "<meta name='author' content='Kelvin R. Lawrence' />"
puts "</head>"
puts "<body>"
puts"<svg xmlns='http://www.w3.org/2000/svg' version='1.1' width='1000' height='1000'>"

x1 = 10
x2 = 410
y1 = y2 = 20

puts "<g stroke='black' fill='none' stroke-width='1'>"

1.upto 20 do
    puts "<line x1='#{x1}' y1='#{y1}' x2='#{x2}' y2='#{y1}' />"
    y1 += 20
end

x1 = 20
y1 = 10
y2 = 410

1.upto 20 do
    puts "<line x1='#{x1}' y1='#{y1}' x2='#{x1}' y2='#{y2}' />"
    x1 += 20
end

puts "</g>"


puts "<circle cx='200' cy='200' r='100' fill='red' fill-opacity='0.5' />"

puts "</svg>"
puts "</body>"
puts "</html>"               
