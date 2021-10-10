require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()

r  = 15
sides = 5
shape = c.createRegPolygon(300,300,sides,100)

c.newGroup(stroke="#006699",fill="none")
#c.drawPolygon(shape)
shape = c.createRegPolygon(300,300,sides,100)
c.drawRegPolygon(300,300,sides,75)
c.drawRegPolygon(300,300,sides,125)

j = 0
sides.times do
  x1 = shape[j] 
  y1 = shape[j+1]
  x2 = shape[j+2]
  y2 = shape[j+3]
  len = c.lineLength(x1,y1,x2,y2).round
  n = len / 3
  d = n
  x = (len/n)
  x.times do
    p = c.lineVectorPoint(x1,y1,x2,y2,d)
    #c.drawRegPolygon(p[0],p[1],sides,r)
    c.drawCircle(p[0],p[1],r)
    d += n
  end
  j += 2
end
c.endGroup()
c.emitFooter()



