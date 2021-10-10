require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
c.setFill("none")
cx = 300
cy = 250
r  = 182
c.setStrokeWidth(2)
c.newGroup("lightblue","none")
4.times do
  c.drawCircle(cx,cy,r)
  w = Math.sqrt(2*r*r)  
  h = w
  x = cx - w/2
  y = cy - h/2
  c.setStroke("#999")
  c.drawRect(x,y,w,h)
  c.setStroke("")
  r -= 55
end
c.endGroup()
c.emitFooter()
