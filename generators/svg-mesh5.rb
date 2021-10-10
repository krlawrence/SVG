
require "./SVGTools.rb"

c = SVGTools.new

c.emitHeader()

y1 = 50
y2 = 500
x1 = 50
x2 = 50

c.setStroke("#000")

19.times do
  c.drawLine(x1,y1,x2,y2)
  x2 += 25
  y1 += 25
end

y1 = 50
y2 = 50
x1 = 50
x2 = 500

19.times do
  c.drawLine(x1,y1,x2,y2)
  x1 += 25
  y2 += 25
end

c.emitFooter()                                                            
