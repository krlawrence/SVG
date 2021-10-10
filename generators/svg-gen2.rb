mode = ARGV[0].to_i

puts "<html>"
puts "<body>"
puts"<svg xmlns='http://www.w3.org/2000/svg' version='1.1' width='500' height='500'>"

clr = %w(lightsalmon orangered yellow gold crimson coral 
	 chocolate indianred sandybrown
	 tomato darksalmon firebrick navajowhite);

puts "<g stroke='none'>"
25.downto 1 do |i|
  if mode == 1
    fill = clr[rand(clr.length)]
  elsif mode == 2
    fill = ( i % 2 == 0 ? clr[0] : clr[1] )
  else
    fill = "rgb(#{rand(255)},#{rand(255)},#{rand(255)})"
  end
  puts "<circle cx='250' cy='250' r='#{10*i}' fill='#{fill}'/>"
end
puts "</g>"

puts "</svg>"
puts "</body>"
puts "</html>"    
