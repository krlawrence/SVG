require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()

x1 = 100
y1 = 100
x2 = 300
y2 = 400
n  = 50
d  = 0
r  = 15

c.setStroke("red")
c.drawLine(x1,y1,x2,y2)

len = c.lineLength(x1,y1,x2,y2).round
x = (len/n)+1
x.times do
  p = c.lineVectorPoint(x1,y1,x2,y2,d)
  #c.drawLine(p[0]-10,p[1],p[0]+10,p[1])
  #c.drawStar(p[0],p[1],r,30)
  #c.drawCircle(p[0],p[1],r)
  c.setFill("#00bb00")
  c.drawRegPolygon(p[0],p[1],6,r)
  d += n
end


c.emitFooter()


