require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
x = 10
y = 10
w = 25
h = 25
d = 2
#r = 255
r= 255
g = 0
b = 0

16.times do |i|
  x1 = x
  16.times do |j|
    c.setFill("rgb(#{r},#{g},#{b})")
    c.drawRect(x1,y,w,h)
    x1 += w+d
    g += 1
  end
  x1 = x
  y += h+d
end

c.emitFooter()
