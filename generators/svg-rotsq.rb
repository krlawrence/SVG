require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()

x  = 200
y  = 200
w  = 100
h  = 100

c.newGroup(stroke="blue", fill="none")
0.step(360,10) do |a|
  print "<rect x='#{x}' y='#{y}' width='#{w}' height='#{h}'"
  print " transform='translate(#{x},#{y}) rotate(#{a}) translate(#{-x},#{-y})'"
  puts " />"
end

c.endGroup()
c.emitFooter()
