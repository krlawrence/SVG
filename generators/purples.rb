require "./SVGTools.rb"
c = SVGTools.new 

c.emitHeader()

x = 50
y = 100

r = 255
b = 0
g = 0

inc = 15
w = 45
h = 100

until ( b > 255 )
  c.setFill("rgb(#{r},#{g},#{b})")
  c.drawRect(x,y,w,h)
  c.setFill("black")
  pct = (r/255.0*100).round
  c.drawText(x+w/2,y+h+20,"#{pct}")
  b += inc
  r -= inc
  x += w
end

c.emitFooter()

