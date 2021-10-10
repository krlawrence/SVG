require "./SVGTools.rb"

c = SVGTools.new

xy = [50,50,170,70,250,175,100,160,80,290,300,40,320,350,400,145,220,440,
      500,250,500,350,400,400,600,400,170,550,270,550,370,550,330,110,
      120,440,600,200,170,200]


def connect(n1,n2,a,c)
  n1 = n1*2
  n2 = n2*2

  path = "M#{a[n1]},#{a[n1+1]} C#{a[n1]},#{a[n1+1]-50},#{a[n2]},#{a[n2+1]-50},#{a[n2]},#{a[n2+1]}"
  c.drawPath(path)
end

c.emitHeader(800,800)

c.setFill("")
c.setStroke("")
c.newGroup( stroke="#0000FF",fill="none")

edges = [0,1,2,16,0,3,2,6,2,3,2,9,2,5,4,8,4,9,3,4,3,19,4,19,7,9,8,17,9,10,9,11,9,12,8,13,
         8,14,14,15,9,18]

(0..edges.length-1).step(2) do |i|
  connect(edges[i],edges[i+1],xy,c)
end

c.endGroup()

c.setFill("")
c.setStroke("")
c.newGroup( stroke="#0000FF",fill="#0066AA")
#c.newGroup( stroke="#aaaaaa",fill="rgb(207,231,245)")

r  = 20

n=1
(0..xy.length - 1).step(2) do |i|
  cx = xy[i]
  cy = xy[i+1]
  c.drawCircle(cx,cy,r)
  c.setFill("white")
  #c.setFill("black")
  c.setStroke("none")
  off = (n < 10 ? 4 : 8)
  c.drawText(cx-off,cy+5,"#{n}")
  c.setFill("")
  c.setStroke("")
  n += 1
end


c.endGroup()
c.emitFooter()
