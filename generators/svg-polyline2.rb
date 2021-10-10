require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()

points = [50,50,250,50,150,200,50,50]

c.setFill("red")
c.drawPolyLine(points)

c.emitFooter()
