require "./SVGTools.rb"

# Command line (optional) arguments:
#   

c = SVGTools.new 

cx = 250
cy = 250
r  = 125
r2 = 10
sweep = 360/6

c.setTitle("Six sided shape generated using circle coordinates.")
c.emitHeader()

pts = []
c.setStrokeWidth(3)
c.newGroup(stroke="black", fill="none")
c.setStrokeWidth("")
0.step(330,sweep) do |a|
  p = c.getPointOnCircle(cx,cy,r,a)
  pts += p
  c.drawLine(cx,cy,p[0],p[1])
end

pts += [pts[0],pts[1]]
c.drawPolyLine(pts)
c.endGroup()

c.newGroup(stroke="blue", fill="blue")
0.step(10,2) do |i|
  c.drawCircle(pts[i],pts[i+1],r2)
end
c.drawCircle(cx,cy,r2)
c.endGroup()

c.emitFooter()



