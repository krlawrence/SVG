require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader(1000,1000,"0,0,5000,5000")
c.setFill("none")
c.setStrokeWidth(4)
c.setStroke("blue")
c.newGroup()
c.setStroke("")
c.setStrokeWidth("")

#c.drawRect(500,500,5000,5000)
cx = 2500 # Midpoint X
cy = 2300 # Midpoint Y
len = 1   # Length of line
inc = 1   # Increment
sweep = 2 # Sweep angle
tx = cx
ty = cy

0.step(3690,sweep) do |a|
  len += inc
  point = c.getPointOnCircle(cx,cy,len,a)  
  c.drawLine(tx,ty,point[0],point[1])
  tx = point[0]
  ty = point[1]
end
c.endGroup()
c.emitFooter()




