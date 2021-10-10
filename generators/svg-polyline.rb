require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()

# points = [10,10,50,10,50,50,100,50,100,10,150,10,150,50,200,50,200,10,250,10]

c.setFill("none")
c.setStroke("black")
x    = 10
y    = 10
xinc = 40
yinc = 60
x2   = 0
y2  = y + yinc

points = [x,y]

7.times do
  x2 = x + xinc
  points += [x2,y]
  points += [x2,y2]
  x2 += xinc
  points += [x2,y2]
  points += [x2,y]
  x = x2
end
points += [x2+xinc,y]
c.drawPolyLine(points)

c.emitFooter()                                                           
