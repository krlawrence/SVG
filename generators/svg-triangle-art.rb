require "./SVGTools.rb"

c = SVGTools.new

c.emitHeader()

cx = 300
cy = 300
r = 100
r2 = 180
d = 18

c.setStroke("#000")

c.setFill("none")
c.setStroke("blue")
c.newGroup()
0.step(360,36) do |a|
  p  = c.getPointOnCircle(cx,cy,r2,a)
  p2 = c.getPointOnCircle(cx,cy,r,a-d)
  p3 = c.getPointOnCircle(cx,cy,r,a+d) 

  path = "M#{p[0]},#{p[1]} L#{p2[0]},#{p2[1]} L#{p3[0]},#{p3[1]}z"
  puts "<path d='#{path}'/>"
end  
c.endGroup()
c.emitFooter()                                                            

