require "./SVGTools.rb"

c = SVGTools.new
c.setTitle("Artwork created using Beziers")
c.emitHeader(800,800)

cx = 300
cy = 300
r  = 300
s1 = 20
s2 = 20
#s1 = 30
#s2 = 40
dec = 30

colors = []
40.times do |i|
  colors[i] = "rgb(#{rand(255)},#{rand(255)},#{rand(255)})"
end


c.setFill("")
c.setStroke("")
c.setFillOpacity(0.5)
c.newGroup( stroke="none",fill="none")
i = 0
points = []
8.times do
  0.step(360-s1,s1) do |a|
    points[0] = cx
    points[1] = cy
    point = c.getPointOnCircle(cx,cy,r,a)
    points[2] = point[0]
    points[3] = point[1]
    point = c.getPointOnCircle(cx,cy,r,a+s2)
    points[4] = point[0]
    points[5] = point[1]
    points[6] = cx
    points[7] = cy
    c.setFill( colors[i])
    path = "M#{points[0]},#{points[1]} C#{points[2]},#{points[3]},#{points[4]},#{points[5]},#{points[6]},#{points[7]}"
    c.drawPath(path)
    i += 1
    if i >= colors.length
      i = 0
    end
  end 
  r -= dec
end
c.endGroup()
c.emitFooter()




