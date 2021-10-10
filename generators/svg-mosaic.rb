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

puts "<g  transform='scale(0.25)'>"
25.times do |i|
  20.times do
    points = []
    0.step(360,inc) do |a|
      points  += c.getPointOnCircle(cx,cy,r,a)
    end                
    cy += 85
    c.setFill("rgb(#{rand(255)},#{rand(255)},#{rand(255)})")
    c.drawPolygon(points)
  end
  cx += 74
  cy = (i %2 ==0 ? 56 : 100)
end

puts "</g>"
c.emitFooter()
