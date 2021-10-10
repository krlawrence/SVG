require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
c.setStroke("")
c.newGroup( stroke="none", fill="none", fillopacity="0.5")

xstart = 50
ystart = 50
cx = xstart
cy = ystart
r  = 10
yinc = 30
xinc = 30

0.upto 20 do
  0.upto 20 do
    c.setFill("rgb(#{rand(255)},#{rand(255)},#{rand(255)})")
    c.drawCircle(cx,cy,r)
    cx += xinc
  end
  cx = xstart
  cy += yinc
end                

c.endGroup()
c.emitFooter()
