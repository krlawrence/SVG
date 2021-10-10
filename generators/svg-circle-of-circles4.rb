require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
c.setFill("none")
c.setStroke("")
c.newGroup( stroke="blue")
c.setFill("")
cx = 300
cy = 300
#r  = 60
r  = 70
# r2 = 60
 r2 = 45
#s  = 360/36
s  = 360/72
#s  = 360/8
0.step(360-s,s) do |a|
  point = c.getPointOnCircle(cx,cy,r,a)
  puts "<circle cx='#{point[0]}' cy='#{point[1]}' r='#{r2}' />"
end                

c.endGroup()
c.emitFooter()
