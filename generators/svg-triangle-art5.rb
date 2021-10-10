require "./SVGTools.rb"

c = SVGTools.new

c.emitHeader()

cx = 300
cy = 300
r  = 100
r2 = 180
d = 18
n = 1

if ARGV[0] != nil
 c.setFill("#000")
 c.drawRect(50,50,500,500)
end
c.setFill("")
#
#colors = ["red","blue","green","cyan","yellow"]
colors = ["darkmagenta","mediumorchid","orchid","mediumturquoise","gold"]
#colors = ["red","blue","cyan","cornflowerblue","crimson"]

5.times do |i|
  c.newGroup(stroke="none", fill="#{colors[i]}", fillopacity="1")

  if i%2 ==0
    start = 0
    stop  = 324
  else
    start = 18
    stop  = 342
  end

  start.step(stop,36) do |a|
    p  = c.getPointOnCircle(cx,cy,r2,a)
    p2 = c.getPointOnCircle(cx,cy,r,a-d)
    p3 = c.getPointOnCircle(cx,cy,r,a+d) 

    path = "M#{p[0]},#{p[1]} L#{p2[0]},#{p2[1]} L#{p3[0]},#{p3[1]}z"
    c.drawPath(path)
  end 
  c.endGroup() 
  r -= 20
  r2 -= 20
end                 
c.endGroup()     

c.emitFooter()                                                            


