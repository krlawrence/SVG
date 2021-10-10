require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
c.setStroke("")
c.newGroup( stroke="none", fill="none", fillopacity="0.5")

xstart = 50
ystart = 50
r  = 15
yinc = 30
xinc = 30
limit = 20
#delta = 15
delta = 15

0.upto limit do
  cx = xstart
  cy = ystart
  0.upto limit do
    0.upto limit do
      c.setFill("rgb(#{rand(255)},#{rand(255)},#{rand(255)})")
      c.drawCircle(cx,cy,r)
      cx += xinc
    end
    cx = xstart
    cy += yinc
  end
  xstart += delta
  ystart += delta
  limit -= 1
  #delta += 5
end

c.endGroup()
c.emitFooter()
