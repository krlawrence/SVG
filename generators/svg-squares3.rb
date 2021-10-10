require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
x = 10
y = 10
#w = 20
#h = 20
w = 30
h = 30
d = 6
c.setFillOpacity(0.8)
c.setStrokeWidth(2)
c.newGroup(stroke="black")
c.setFillOpacity("")
16.times do |i|
  x1 = x
  16.times do |j|
  r = rand(255)
  g = rand(255)
  b = rand(255)
    c.setFill("rgb(#{r},#{g},#{b})")
    c.drawRect(x1,y,w,h)
    x1 += w+d
  end
  x1 = x
  y += h+d
end
c.endGroup()
c.emitFooter()

