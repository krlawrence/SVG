require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()

cx  = 250
cy  = 250
rx  = 200
ry  = 100

puts "<g fill-opacity='0.5'>"
0.step(360,20) do |a|
  print "<ellipse cx='#{cx}' cy='#{cy}' rx='#{rx}' ry='#{ry}'"
  print " transform='translate(#{cx},#{cy}) rotate(#{a}) translate(#{-cx},#{-cy})'"
  print " fill='rgb(#{rand(255)},#{rand(255)},#{rand(255)})'"
  puts " />"
end
puts "</g>"
c.setFill("white")
c.drawCircle(cx,cy,rx/3)
c.endGroup()
c.emitFooter()
