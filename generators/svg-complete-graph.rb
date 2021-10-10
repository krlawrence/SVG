require "./SVGTools.rb"

c = SVGTools.new
c.setTitle("Examples of complete graphs (every node connected to every other node)")
c.emitHeader(1000,1000)
#c.emitHeader(1500,1500)

if ARGV[0] != nil
  num = ARGV[0].to_i
else
  num = 18
end

if ARGV[1] != nil
  r = ARGV[1].to_i
else
  r = 200
end

cx = 300
cy = 300
#cx = 500
#cy = 500
points = []
sweep = 360.0/num

#a = 0
a = 270
c.newGroup(stroke="none",fill="blue")
num.times do |i|
  #points[i] = c.getPointOnCircle(cx,cy,r,a)
  points[i] = c.getPointOnCircleFloat(cx,cy,r,a)
  #c.drawCircle(points[i][0],points[i][1],5)
  a += sweep
end
c.endGroup()

c.setStrokeWidth(0.5)
#c.setStroke("blue")
c.newGroup()
c.setStrokeWidth("")
c.setStroke("")

f = true

num.times do |i|
  #c.setStroke("rgb(#{rand(255)},#{rand(255)},#{rand(255)})")
  clr = (f ? "red" : "blue")
  f = !f
  c.setStroke(clr)
  (i+1).step(num-1,1) do |j|
    c.drawLine(points[i][0],points[i][1],points[j][0],points[j][1])
  end
end
c.endGroup()
c.emitFooter()




