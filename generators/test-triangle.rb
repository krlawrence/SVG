
require "./SVGTools.rb"

c = SVGTools.new 
c.setTitle("Equilateral triangle")
c.emitHeader()

c.setFill("none")
c.setStroke("blue")
c.setStrokeWidth(2)
c.drawTriangleEq(100,500,500)
c.emitFooter()





