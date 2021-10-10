puts "<html>"
puts "<body>"
puts"<svg xmlns='http://www.w3.org/2000/svg' version='1.1' width='500' height='500'>"

puts "<g stroke='blue' fill='none'>"
for i in (1..50)
  puts "<circle cx='250' cy='250' r='#{4*i}'/>"
end
puts "</g>"

puts "</svg>"
puts "</body>"
puts "</html>"
