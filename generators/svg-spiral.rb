require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader(1000,1000,"")
c.setFill("")
c.setStroke("blue")

cx = 500   # Midpoint X
cy = 500   # Midpoint Y
len = 5    # Length of line
inc = 5    # Increment
sweep = 5  # Sweep angle

0.step(360,sweep) do |a|
  len += inc
  point = c.getPointOnCircle(cx,cy,len,a)  
  c.drawLine(cx,cy,point[0],point[1])
end

c.emitFooter()



