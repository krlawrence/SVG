require "./SVGTools.rb"

c = SVGTools.new

c.emitHeader()

cx = 300
cy = 300
r = 100
r2 = 180
d = 18
n = 1

c.newGroup(stroke="none", fill="none", fillopacity="0.5")
0.step(360,36) do |a|
  p  = c.getPointOnCircle(cx,cy,r2,a)
  p2 = c.getPointOnCircle(cx,cy,r,a-d)
  p3 = c.getPointOnCircle(cx,cy,r,a+d) 

  path = "M#{p[0]},#{p[1]} L#{p2[0]},#{p2[1]} L#{p3[0]},#{p3[1]}z"
  #c.setFill("rgb(#{rand(255)},#{rand(255)},#{rand(255)})")
  if n % 2 == 0
    f = "rgb(142,24,235)"
  else
    f = "rgb(217,122,238)"
  end
  n += 1
  c.setFill(f)
  c.drawPath(path)
end  
c.endGroup()
c.emitFooter()                                                            


