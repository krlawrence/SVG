require "./SVGTools.rb"

c = SVGTools.new

c.emitHeader(800,800)

cx = 300
cy = 300
r1 = 100
#r2 = 230
r2 = 150
s1 = 60
#s1 = 20
#s2 = 20
s2 = 60
d = 80

#colors = %w(bisque coral darksalmon)
colors = %w(bisque coral darksalmon palevioletred rosybrown lightcoral )

c.setFill("")
c.setStroke("")
#c.newGroup( stroke="#999999",fill="powderblue")
#c.newGroup( stroke="#999999",fill="none")
c.newGroup( stroke="none",fill="none")
i = 0
j = 0
points = []
0.step(360-s1,s1) do |a|
  points[0] = cx
  points[1] = cy
  point = c.getPointOnCircle(cx,cy,r1,a)
  points[2] = point[0]
  points[3] = point[1]
  r3 = (j%2 == 0 ? r2 : r2+d)
  j += 1
  point = c.getPointOnCircle(cx,cy,r3,a+s2/2)
  points[4] = point[0]
  points[5] = point[1]
  point = c.getPointOnCircle(cx,cy,r1,a+s2)
  points[6] = point[0]
  points[7] = point[1]
  points[8] = cx
  points[9] = cy
  c.setFill( colors[i])
  c.drawPolyLine(points)
  i += 1
  if i >= colors.length
    i = 0
  end
end 

c.endGroup()
c.emitFooter()



