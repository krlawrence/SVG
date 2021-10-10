require "./SVGTools.rb"

@c = SVGTools.new 

def drawStar(cx,cy)
r    = 15
step = 20

0.step(360,step) do |a|
  point = @c.getPointOnCircle(cx,cy,r,a)
  @c.drawLine(cx,cy,point[0],point[1])
end                
end

##

@c.emitHeader()
@c.setFill("none")
@c.setStroke("")
@c.newGroup( stroke="blue")

cx = 300
cy = 300
r  = 150
s  = 20

0.step(360,s) do |a|
  point = @c.getPointOnCircle(cx,cy,r,a)
  drawStar(point[0],point[1])
end                

@c.endGroup()
@c.emitFooter()
