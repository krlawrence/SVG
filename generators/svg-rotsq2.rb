require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()

x  = 100
y  = 100
w  = 200
h  = 200
cx = x+w/2
cy = y+h/2

c.newGroup(stroke="blue", fill="none")
0.step(360,20) do |a|
  print "<rect x='#{x}' y='#{y}' width='#{w}' height='#{h}'"
  print " transform='translate(#{cx},#{cy}) rotate(#{a}) translate(#{-cx},#{-cy})'"
  puts " />"
end

c.endGroup()
c.emitFooter()
