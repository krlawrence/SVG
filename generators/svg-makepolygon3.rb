require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()

sides = 5
r     = 150
cx    = 200
cy    = 200
#puts ARGV.length
#ARGV.length.times do |i|
#  puts ARGV[i]
#end
if ARGV[0] !=nil
  sides = ARGV[0].to_i
end

if ARGV[1] !=nil
  r = ARGV[1].to_i
end

if ARGV[2] !=nil
  cx = ARGV[2].to_i
end

if ARGV[3] !=nil
  cy = ARGV[3].to_i
end

c.setLineCap("round")
#c.setDashArray("1 10")
c.setStroke("blue")
c.setStrokeWidth(4)
c.setFill("lightblue")
points = c.createRegPolygon(cx,cy,sides,r)
c.drawPolygon(points)
j = 0
sides.times do
  c.drawLine(cx,cy,points[j],points[j+1])
  j+= 2
end
c.emitFooter()

