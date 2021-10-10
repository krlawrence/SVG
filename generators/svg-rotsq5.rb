require "./SVGTools.rb"

c = SVGTools.new 
c.setTitle("Rotated squares to create a spiral effect")
c.emitHeader()

x  = 400
y  = 400
w  = 50
h  = 50

sign = 1

cx = x + w/2
cy = y + h/2

ad  = 10
wd  = 30

c.setFill("none")
c.newGroup()
c.setFill("")

#15.times do
1.times do
  a = 0
  (360/ad).times do |i|
    clr = i%2==0 ? "brown" : "lightsalmon"
    #clr = i%2==0 ? "blue" : "red"
    #clr = "rgb(#{rand(255)},#{rand(255)},#{rand(255)})"
    #c.setStroke(clr)
    c.setFill(clr)
    tx = "rotate(#{a},#{cx},#{cy})"
    c.setTransform(tx)
    c.drawRect(x,y,w,h)
    a += ad
  end
  x -= wd/2
  y -= wd/2
  w += wd/2
  h += wd/2
end

c.endGroup()
c.emitFooter()


