# 
#
require "./SVGTools.rb"
c = SVGTools.new 

if ARGV[0] != nil
  inc = ARGV[0].to_i
else
  inc = 5
end 

c.emitHeader(800,800)

c.setStroke("blue")
c.setFill("none")

a = 270
r = 100
cx = 200
cy = 200
step = 360.0 / inc
points = []    

while (a < (270+360) )
  points += c.getPointOnCircle(cx,cy,r,a)
  a += step;
end

0.step(points.length-1,2) do |i|
  c.drawLine( cx,cy,points[i],points[i+1] )
end

#c.drawPolyLine( points )

c.emitFooter()



