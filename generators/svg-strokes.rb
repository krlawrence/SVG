require "./SVGTools.rb"

c = SVGTools.new

c.setTitle("Playing with stroke widths")
c.emitHeader()
     
sw    = 1
inc   = 5
swinc = 1
len   = 2
x1    = 50
x2    = x1+len
y1    = 100
y2    = 100

colors = %W(blue green)

2.times do |i|
  c.newGroup(stroke=colors[i])
  100.times do
   c.setStrokeWidth(sw)
   c.drawLine(x1,y1,x2,y2)
   x1 += inc
   x2 = x1 + len
   sw += swinc
  end
  c.setStrokeWidth("")
  c.endGroup()
  inc = -5
  len = -2
  y1 += sw
  y2 = y1
  x1 += inc
  x2 = x1 + len
  sw = 1
end
c.emitFooter()                                                            
