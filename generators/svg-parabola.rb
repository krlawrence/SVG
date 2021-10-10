
require "./SVGTools.rb"

c = SVGTools.new

c.emitHeader()
points = []
points2 = []
ybase = 500
xbase = 100
d = Math::PI/180.0

-2.step(2,0.1)  do |i|
  y = ybase - ((i*i)+1) * 70
  points += [(i*100)+300,y]
end

c.setStroke("blue")
c.setFill("none")
c.drawPolyLine(points)
c.setStroke("#999")
c.drawLine(xbase-50,ybase,xbase+450,ybase)
c.drawLine(xbase+200,50,xbase+200,ybase+100)

puts "<text x='50' y='50' fill='#00f' stroke='none'>y = x<tspan baseline-shift='super' font-size='small'>2</tspan>+1</text>"
c.emitFooter()                                                            
