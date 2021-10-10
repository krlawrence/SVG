require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()

if ARGV[0] !=""
  sides = ARGV[0].to_i
else
  sides = 5
end

cx = 200
cy = 200
r  = 150
inc = 360.0/sides
points = []

c.setStroke("blue")
c.setFill("")    
270.step(630,inc) do |a|
  p= c.getPointOnCircle(cx,cy,r,a)
  points += p
  c.drawLine(cx,cy,p[0],p[1])
end  
c.setFill("none")
c.drawPolygon(points)
c.drawCircle(cx,cy,r)

#c.drawLine(cx,cy,cx,cy+r)
#c.drawLine(cx,cy,cx+r,cy)
c.drawLine(cx,cy,cx+129.9,cy)

print "<text x='#{cx-r}' y='#{cy+r+50}' font-size='24' fill='black'>"
puts "A polygon with #{sides} sides in a circle!</text>"
c.emitFooter()

