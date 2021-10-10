# Creates an SVG graphic of a very basic Christmas Tree
#
require "./SVGTools.rb"
c = SVGTools.new 

c.emitHeader()
if ARGV[0] != nil
 balls = true
else
  balls = false
end

def drawBalls(ctx,pts)
  (2...pts.length).step(4) do |i|
    ctx.setFill("rgb(#{rand(255)},#{rand(255)},#{rand(255)})")
    ctx.drawCircle(pts[i],pts[i+1],10) 
    ctx.setFill("") 
  end
end

c.setStroke("darkgreen")
c.setStrokeWidth(2)
c.setFill("none")
c.newGroup()
c.setStroke("")
c.setStrokeWidth("")
c.setFill("")

x = 300      # Mid-point of the tree
y0 = 700     # Bottom of the tree (except for trunk)
d = 0.1      # Initial modifier for width of branches
inc = 0.05   # Amount the width modifier increments by at each level
t = 15       # Width of the trunk (tree middle space)
b = 30       # Vertical size of brances

y = y0
points = []
points += [x,y]

while (d < 1.0 )
  x2 = x * d
  points += [x2,y]
  y2 = y - b
  points += [x-t,y2]
  d += inc
  y = y2
end
points[points.length-2] = x
c.drawPolyLine( points )

if (balls)
  drawBalls(c,points) 
end

y = y0
d = 1.9
points = []
points += [x,y]

while (d > 1.0 )
  x2 = x * d
  points += [x2,y]
  y2 = y - b
  points += [x+t,y2]
  d -= inc
  y = y2
end

points[points.length-2] = x
c.drawPolyLine( points )

if (balls)
  drawBalls(c,points) 
end 

data = "M#{x-t*2},#{y0} v50 h#{t*4} v-50"
c.drawPath(data)

c.endGroup()
c.emitFooter()
