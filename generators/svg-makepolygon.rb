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
270.step(630,inc) do |a|
  points  += c.getPointOnCircle(cx,cy,r,a)
end                

c.setStroke("#999")
c.setStrokeWidth(5)
c.setFill("lightblue")
c.drawPolygon(points)
print "<text x='#{cx-r}' y='#{cy+r+50}' font-size='24' fill='black'>"
puts "A polygon with #{sides} sides.</text>"
c.emitFooter()
