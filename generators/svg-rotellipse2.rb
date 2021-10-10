require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()

cx  = 250
cy  = 250
rx  = 200
ry  = 100

puts "<g stroke-opacity='0.5' stroke-width='20' fill='none'>"
0.step(360,10) do |a|
  print "<ellipse cx='#{cx}' cy='#{cy}' rx='#{rx}' ry='#{ry}'"
  print " transform='translate(#{cx},#{cy}) rotate(#{a}) translate(#{-cx},#{-cy})'"
  print " stroke='rgb(#{rand(255)},#{rand(255)},#{rand(255)})'"
  puts " />"
end
puts "</g>"
c.endGroup()
c.emitFooter()
