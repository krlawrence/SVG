require "./SVGTools.rb"

c = SVGTools.new

c.setMetaData("script-version",2)
c.emitHeader(800,800)

cx = 300
cy = 300
r1 = 100
#r2 = 230
r2 = 200
s1 = 30
#s1 = 20
#s2 = 20
s2 = 30

c.setFill("")
c.setStroke("")
#c.newGroup( stroke="#999999",fill="powderblue")
c.newGroup( stroke="#999999",fill="none")
i = 0
points = []
0.step(360-s1,s1) do |a|
  points[0] = cx
  points[1] = cy
  point = c.getPointOnCircle(cx,cy,r1,a)
  points[2] = point[0]
  points[3] = point[1]
  point = c.getPointOnCircle(cx,cy,r2,a+s2/2)
  points[4] = point[0]
  points[5] = point[1]
  point = c.getPointOnCircle(cx,cy,r1,a+s2)
  points[6] = point[0]
  points[7] = point[1]
  points[8] = cx
  points[9] = cy
  c.setFill( i%2 == 0 ? "purple" : "#666666")
  c.drawPolygon(points)
  i += 1
end 

c.endGroup()
c.emitFooter()

