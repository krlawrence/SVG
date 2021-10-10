require "./SVGTools.rb"

# Command line (optional) arguments:
#   0: Number of shapes
#   1: Maximum possible starting radius of any shape
#   2: Minimum possible starting radius of any shape
#   3: Maximum possible rings in any shape
#   4: Minimum possible rings in any shape
#   5: Opacity

c = SVGTools.new 

rmin  = 60
#rmax  = 100
rmax  = 150
xmax  = 800
ymax  = 800
cmin  = 3
cmax  = 10
opacity = 0.5
numcircles = 150

if ARGV[0] != nil
  numcircles = ARGV[0].to_i
end

if ARGV[1] != nil
  rmax = ARGV[1].to_i
end

if ARGV[2] != nil
  rmin = ARGV[2].to_i
end

if ARGV[3] != nil
  cmax = ARGV[3].to_i
end

if ARGV[4] != nil
  cmin = ARGV[4].to_i
end

if ARGV[5] != nil
  opacity = ARGV[5].to_f
end

c.setTitle("Randomly generated circles")
c.setMetaData("p0",numcircles)
c.setMetaData("p1",rmax)
c.setMetaData("p2",rmin)
c.setMetaData("p3",cmax)
c.setMetaData("p4",cmin)
c.setMetaData("p5",opacity)

c.emitHeader()
c.setFillOpacity(opacity)
c.newGroup( stroke="none")
c.setFillOpacity("")

numcircles.times do
  r = [rand(rmax),rmin].max
  #rings = 5
  rings = [cmin,rand(cmax)].max
  i = r/rings
  cx = rand(xmax)
  cy = rand(ymax)
  col = "rgb(#{rand(255)},#{rand(255)},#{rand(255)})"
  rings.times do |n|
    c.setFill( n%2 == 0 ? col : "white") 
    c.drawCircle(cx,cy,r)
    r -= i
  end
end                

c.endGroup()
c.emitFooter()


# Method that can be added to SVGTools
def drawConcentricCircles(cx,cy,r,rings,col1,col2)
  i = r/rings
  rings.times do |n|
    setFill( n%2 == 0 ? col1 : col2) 
    drawCircle(cx,cy,r)
    r -= i
  end
end
