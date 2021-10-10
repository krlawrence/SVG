require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
c.setFill("none")
c.setStroke("")
c.setFill("#f00")
colors = ["#c00","#a00","#800"]
cx = 300
cy = 300
r  = 60
s  = 360/8
c.drawCircle(cx,cy,r)
r3 = 0
3.times do |i|        

  t = r
  r /= 2 
  r3 += (r + t + 10)
  #c.setFill(colors[i])
  c.newGroup( stroke="", fill="#{colors[i]}")  
  c.setFill("")
  0.step(360,s) do |a|
    point = c.getPointOnCircle(cx,cy,r3,a)
    c.drawCircle(point[0], point[1], r)
  end          
  c.endGroup()      
end

c.emitFooter()
