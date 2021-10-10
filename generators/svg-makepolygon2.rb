require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()


orgcx = cx = 100
orgcy = cy = 100
r  = 50

sides = 3
c.setStrokeWidth(3)
c.newGroup(stroke="#999",fill="lightblue",fillopacity="0.3")
c.setFill("")
c.setStroke("")
c.setStrokeWidth("") 
36.times do
  inc = 360.0/sides
  points = []

  270.step(630,inc) do |a|
    points  += c.getPointOnCircle(cx,cy,r,a)
  end                

  c.drawPolygon(points)
  c.setStroke("none")
  c.setFill("blue")
  
  c.drawText(cx-7,cy+5,sides)
  c.setStroke("")
  c.setFill("")

  sides += 1
  if cx > orgcx * 6
    cx = orgcx
    cy += 2*r +10
  else
    cx += 2*r + 10 
  end
  
end

c.emitFooter()

