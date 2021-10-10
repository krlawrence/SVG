require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()

points = []


1.upto 500 do |i|
  points += [i,rand(200)]
end

c.setFill("none")
c.setStroke("black")
c.drawPolyLine(points)

c.emitFooter()
