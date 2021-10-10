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
points = [cx,cy]

0.step(3690,sweep) do |a|
  len += inc
  points += c.getPointOnCircle(cx,cy,len,a)  
end
  c.drawPolyLine(points)
c.endGroup()
c.emitFooter()





