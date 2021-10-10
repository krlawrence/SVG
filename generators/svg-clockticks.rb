
require "./SVGTools.rb"
c = SVGTools.new 

c.emitHeader()

cx = 0
cy = 0
r1  = 170
r2  = 155

0.step(360,6) do |a|
  pt = c.getPointOnCircle(cx,cy,r1,a)
  #print "#{a} = (#{pt[0]} , #{pt[1]})"
  print "<line x1='#{pt[0]}' y1='#{pt[1]}'"
  pt = c.getPointOnCircle(cx,cy,r2,a)
  puts " x2='#{pt[0]}' y2='#{pt[1]}'/>"
end
c.emitFooter()

