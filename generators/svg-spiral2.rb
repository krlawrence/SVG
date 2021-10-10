require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader(1000,1000,"")
c.setFill("")
c.setStroke("blue")

cx = 500   # Midpoint X
cy = 500   # Midpoint Y
len = 1    # Length of line
inc = 0.1  # Increment
sweep = 0.5  # Sweep angle
tx = cx
ty = cy

0.step(1800,sweep) do |a|
  len += inc
  point = c.getPointOnCircle(cx,cy,len,a)  
  c.drawLine(tx,ty,point[0],point[1])
  tx = point[0]
  ty = point[1]
end

c.emitFooter()




