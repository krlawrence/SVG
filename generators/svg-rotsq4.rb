require "./SVGTools.rb"

c = SVGTools.new 
c.setTitle("Rotated squares to create a spiral effect")
c.emitHeader()

x  = 400
y  = 400
w  = 20
h  = 20

sign = 1

cx = x + w/2
cy = y + h/2

a   = 270
ad  = 1
wd  = 0.5

c.setFill("none")
c.newGroup()
c.setFill("")
990.times do |i|
  clr = i%2==0 ? "blue" : "red"
  c.setStroke(clr)
  #tx = "rotate(#{a},#{cx},#{cy})"
  tx = "translate(400,400) rotate(#{a}) translate(-400,-400)"
  c.setTransform(tx)
  c.drawRect(x,y,w,h)

#  if i > 1500
#    sign = -1
#  elsif i> 1000
#    sign = 1
#  elsif i> 500
#    sign = -1
#  end

  a += ad
  x -= wd/2.0 * sign
  y -= wd/2.0 * sign
  w += wd/2.0 * sign
  h += wd/2.0 * sign
end

c.endGroup()
c.emitFooter()

