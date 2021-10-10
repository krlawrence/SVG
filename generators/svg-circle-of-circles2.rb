require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
c.setFill("none")
c.setStroke("")
c.newGroup( stroke="blue")
c.setFill("")
cx = 300
cy = 300
r  = 60
s  = 360/8
c.drawCircle(cx,cy,r)
r3 = 0
3.times do
  t = r
  r /= 2 
  r3 += (r + t + 10)
  0.step(360,s) do |a|
    point = c.getPointOnCircle(cx,cy,r3,a)
    puts "<circle cx='#{point[0]}' cy='#{point[1]}' r='#{r}' />"
  end                
end

c.endGroup()
c.emitFooter()
