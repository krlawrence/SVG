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
n = 16
c.setFillOpacity(1)
c.setStrokeWidth(2)
c.newGroup(stroke="black")
c.setFillOpacity("")
16.times do |k|
  fill = (k%2==0) ? "blue" : "yellow"
  y1 = y
  n.times do |i|
    x1 = x
    n.times do |j|
      c.setFill(fill)
      c.drawRect(x1,y1,w,h)
      x1 += w+d
    end
    x1 = x
    y1 += h+d
  end
  n -= 1
  x = x + w/2 + d/2
  y = y + h/2 +d/2
end
c.endGroup()
c.emitFooter()

