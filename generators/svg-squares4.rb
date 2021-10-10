require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
x = 10
y = 10
#w = 20
#h = 20
w = 30
h = 30
d = 1
n = 16
c.setFillOpacity(1)
c.setStrokeWidth(2)
c.newGroup(stroke="#a00000")
c.setFillOpacity("")
16.times do
  y1 = y
  n.times do |i|
    x1 = x
    n.times do |j|
      #r = rand(255)
      #g = rand(255)
      #b = rand(255)
      r=255;g=0;b=0;
      c.setFill("rgb(#{r},#{g},#{b})")
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

