require "./SVGTools.rb"

c = SVGTools.new 
c.setTitle("Mesh grid made out of circles")
c.emitHeader()
c.setStrokeOpacity("0.5")
c.newGroup( stroke="black", fill="none")
c.setStrokeOpacity("")

xstart = 50
ystart = 50
cx = xstart
cy = ystart
r  = 3
yinc = (r*2)+1
xinc = (r*2)+1
#yinc = 8
#xinc = 8
gridWidth = 60
gridHeight = 60

0.upto gridHeight do |row|
  0.upto gridWidth do |col|
    #c.setFill("rgb(#{rand(255)},#{rand(255)},#{rand(255)})") i
    if col == 0 or col == gridWidth or row == 0 or row == gridHeight
      c.setFill("black")
      c.setStroke("none")
    end
    c.drawCircle(cx,cy,r)
    c.setFill("")
    c.setStroke("")
    cx += xinc
  end
  cx = xstart
  cy += yinc
end                

c.endGroup()
c.emitFooter()

