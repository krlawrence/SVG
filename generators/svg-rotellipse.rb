require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()

cx  = 200
cy  = 200
rx  = 200
ry  = 100

c.newGroup(stroke="blue", fill="none")
0.step(360,10) do |a|
  print "<ellipse cx='#{cx}' cy='#{cy}' rx='#{rx}' ry='#{ry}'"
  print " transform='translate(#{cx},#{cy}) rotate(#{a}) translate(#{-cx},#{-cy})'"
  puts " />"
end

c.endGroup()
c.emitFooter()
