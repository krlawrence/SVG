require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
puts ARGV[0]
if ARGV[0] != nil
  sides = ARGV[0].to_i
else
  sides = 5
end

cx = 100
cy = 100
r  = 50
inc = 360.0/sides
9.times do |i|
  5.times do
    points = []
    0.step(360,inc) do |a|
      points  += c.getPointOnCircle(cx,cy,r,a)
    end                
    c.setFill("rgb(#{rand(255)},#{rand(255)},#{rand(255)})")
    c.setStroke("black")
    c.drawPolygon(points)
    c.drawLine(cx,cy,cx-r,cy)
    c.drawLine(cx,cy,points[2],points[3])
    c.drawLine(cx,cy,points[10],points[11])
    cy += 85
  end
  cx += 74
  cy = (i %2 ==0 ? 56 : 100)
end
c.emitFooter()

