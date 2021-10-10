require "./SVGTools.rb"

@c = SVGTools.new 

@c.emitHeader()
@c.setFill("none")
@c.setStroke("")
@c.newGroup( stroke="blue")

cx = 300
cy = 300
r  = 150
s  = 2
r2 = 30

0.step(360,s) do |a|
  point = @c.getPointOnCircle(cx,cy,r,a)
  #puts "<circle cx='#{point[0]}' cy='#{point[1]}' r='#{r2}' />"
  puts "<rect x='#{point[0]-30}' y='#{point[1]-30}' width='50' height='50' />"
end                

@c.endGroup()
@c.emitFooter()
