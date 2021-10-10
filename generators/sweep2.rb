
require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()

c.setFill("none")
c.setStroke("")

PI = Math::PI

r  = 150
cx = 200
cy = 200
step = 15

c.newGroup( stroke="blue")

0.step(360,step) do |a|
  x2 = cx + (r*Math.cos(PI*a/180)).round
  y2 = cy + (r*Math.sin(PI*a/180)).round
  #puts"#{x2}  #{y2}"
  c.drawLine(cx,cy,x2,y2)
end                

c.endGroup()

#c.drawCircle(cx,cy,r)

c.emitFooter()
