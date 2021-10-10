require "./SVGTools.rb"

c = SVGTools.new

c.emitHeader(500,500)
points = []
points2 = []
ybase = 300
xbase = 200

-3.step(3,0.1)  do |x|
  v = 10-Math.sqrt(x*x)*50
  y = ybase - v 
  y2 = ybase + v
  points += [xbase+x*50,y]
  points2 += [xbase+x*50,y2]
end

c.setStroke("blue")
c.setFill("none")
c.drawPolyLine(points)
c.drawPolyLine(points2)
c.setStroke("#999")
c.drawLine(xbase-200,ybase,xbase+200,ybase)
c.drawLine(xbase,100,xbase,ybase+200)

puts "<text x='50' y='50' fill='#00f' stroke='none'>x<tspan baseline-shift='super' font-size='small'>2</tspan> + y<tspan baseline-shift='super' font-size='small'>2</tspan>&nbsp;=&nbsp;10</text>"
c.emitFooter()                                                            
