require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
puts ARGV[0]
if ARGV[0] != nil
  sides = ARGV[0].to_i
else
  sides = 4
end

cx = 100
cy = 100
r  = 50
inc = 360.0/sides

11.times do |i|
  5.times do
    points = []
    0.step(360,inc) do |a|
      points  += c.getPointOnCircle(cx,cy,r,a)
    end                
    cy += r*2
    c.setFill("rgb(#{rand(255)},#{rand(255)},#{rand(255)})")
    c.drawPolygon(points)
  end
  cx += r
  cy = (i %2 ==0 ? r : r*2)
end
c.emitFooter()
