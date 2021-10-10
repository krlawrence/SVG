require "./SVGTools.rb"

c = SVGTools.new 
c.setTitle("Sierpinski triangle")
c.emitHeader()

#Given an array of vertices, render the triangles
def renderTriangles(p,c)
  n = p.size/6
  i = 0
  n.times do
    lines = [p[i],p[i+1],p[i+2],p[i+3],p[i+4],p[i+5],p[i],p[i+1]]
    #Uncommenting this line would make every single triangle a random color
    #c.setFill("rgb(#{rand(255)},#{rand(255)},#{rand(255)})")
    c.drawPolyLine(lines)
    i += 6
  end
end

# Subdivide a triangle into 3 new triangles
def subdivide(tri,c)
  m = []
  nt = []
  s1 = [tri[0],tri[1],tri[2],tri[3]]
  s2 = [tri[2],tri[3],tri[4],tri[5]]
  s3 = [tri[4],tri[5],tri[0],tri[1]]
  m[0] = c.lineMidpointArrayFloat(s1)
  m[1] = c.lineMidpointArrayFloat(s2)
  m[2] = c.lineMidpointArrayFloat(s3)

  nt += m[0]
  nt += m[2]
  nt += [s1[0],s1[1]]

  nt += m[2]                                                               
  nt += m[1]
  nt += [s2[2],s2[3]]

  nt += m[0]
  nt += [s1[2],s1[3]]
  nt += m[1]
  return nt
end                       

# The total number of triangles generated will be 3**depth
if ARGV[0] != nil
  depth = ARGV[0].to_i
else
  depth = 3
end

# Either generate a new base triangle or use our default one
if ARGV[1] != nil
  base = c.createTriangleEq(ARGV[1].to_i, ARGV[2].to_i, ARGV[3].to_i)
else
  base = [100,500,350,67,600,500]
end

if ARGV[4] == "f"
  fill = true
else
  fill = false
end

if fill
  c.setFill("rgb(#{rand(255)},#{rand(255)},#{rand(255)})")
  renderTriangles(base,c)
end

depth.times do
  i = 0
  newbase = []
  n = base.size/6
  n.times do
    tr = [base[i],base[i+1],base[i+2],base[i+3],base[i+4],base[i+5]]
    newbase += subdivide(tr,c)
    i += 6
  end
  base = newbase
  if fill
    c.setFill("rgb(#{rand(255)},#{rand(255)},#{rand(255)})")
    c.newGroup()
    c.setFill("")
    renderTriangles(base,c)
    c.endGroup()
  end
end

if !fill
  c.setFill("none")
  c.setStroke("blue")
  c.setStrokeWidth(1)
  c.newGroup()
  c.setFill("")
  c.setStroke("")
  c.setStrokeWidth("")
  renderTriangles(base,c)
c.endGroup()
end  

c.emitFooter()






