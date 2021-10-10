require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()

c.setStroke("")

PI = Math::PI

r  = 150
cx = 200
cy = 200
inc = 18

data = ""
points = []

0.step(360,inc) do |a|
  x2 = cx + (r*Math.cos(PI*a/180)).round
  y2 = cy + (r*Math.sin(PI*a/180)).round
  points += [x2,y2]
end

n = 0
0.step(points.length-4,2) do
  c.setFill("rgb(#{rand(255)},#{rand(255)},#{rand(255)})")

  data =  "M #{cx},#{cy} L #{points[n]},#{points[n+1]} "
  data += "A #{r},#{r},0,0,1,#{points[n+2]},#{points[n+3]} z"
  c.drawPath(data) 
  n += 2
end


c.emitFooter()

=begin
    def drawPie(cx,cy,r,values[])
    def drawPie(cx,cy,r,angles[])
    def drawSlice(cx,cy,r,angle)
=end
