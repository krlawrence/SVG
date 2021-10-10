require "./SVGTools.rb"

c = SVGTools.new

c.setTitle("Tests")
c.emitHeader(900,800)

cx = 400
cy = 400
r  = 250

c.setStroke("blue")
c.setFill("none")
c.newGroup()
180.step(360,3) do |a|
  points = c.getPointOnCircle(cx,cy,r,a)
  c.drawLine(cx,cy,points[0],points[1])  
end
c.endGroup()
c.emitFooter()                                                            
