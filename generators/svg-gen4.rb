mode = ARGV[0].to_i

puts "<html>"
puts "<body>"
puts"<svg xmlns='http://www.w3.org/2000/svg' version='1.1' width='1000' height='1000'>"

puts "<g stroke='none' fill-opacity='0.8'>"

150.downto 1 do |i|
  cx = rand(750)
  cy = rand(750)
  r  = rand(150)
  fill = "rgb(#{rand(255)},#{rand(255)},#{rand(255)})"
  puts "<circle cx='#{cx}' cy='#{cy}' r='#{r}' fill='#{fill}'/>"
end

puts "</g>"

puts "</svg>"
puts "</body>"
puts "</html>"     
