
require "./SVGTools.rb"

c = SVGTools.new

c.emitHeader()
points = []
#points2 = []
ybase = 300
xbase = 100
d = Math::PI/180.0

0.upto 720 do |a|
y = ybase - Math.sin(a*d*4) * Math.cos(a*d) * 100
#  y = ybase - Math.sin(a*d) * 100
#  y = ybase - Math.sin(a*d*4) * 100
#  y2 = ybase - Math.cos(a*d) * 100
  points += [a+xbase,y]
#  points2 += [a+xbase,y2]
end

c.setStroke("blue")
c.setFill("none")
c.drawPolyLine(points)
#c.setStroke("red")
#c.drawPolyLine(points2)
c.setStroke("#999")
c.drawLine(xbase-50,ybase,xbase+720+50,ybase)
c.setStroke("none")
c.setFill("#000")
c.drawText(50,50,"y = sin(x*4) * cos(x)")
c.emitFooter()                                                            
