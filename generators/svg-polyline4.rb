require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()

points = []

x=0
1.upto 300 do |i|
  points += [x,rand(200)]
  x += 3
end

c.setFill("none")
c.setStroke("black")
c.drawPolyLine(points)

c.emitFooter()
