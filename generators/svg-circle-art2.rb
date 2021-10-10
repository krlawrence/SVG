require "./SVGTools.rb"

c = SVGTools.new

cx = 300
cy = 300
r1 = 100
#r2 = 230
r2 = 180
s1 = 18
#s1 = 6
#s1 = 20
#s2 = 20
#s2 = 6
s2 = 18

c.setMetaData("script-version",3)
c.setMetaData("script-params","#{cx},#{cy},#{r1},#{r2},#{s1},#{s2}")
c.setTitle("Flower shape constructed using points on a circle")
c.emitHeader(800,800)

#colors = %w(bisque coral darksalmon)
colors = %w(bisque coral darksalmon palevioletred lightcoral)

c.setFill("")
c.setStroke("")
#c.newGroup( stroke="#999999",fill="powderblue")
#c.newGroup( stroke="#999999",fill="none")
c.newGroup( stroke="none",fill="none")
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
  c.setFill( colors[i])
  c.drawPolygon(points)
  i += 1
  if i >= colors.length
    i = 0
  end
end 

c.endGroup()
c.emitFooter()


