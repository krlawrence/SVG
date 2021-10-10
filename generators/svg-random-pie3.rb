# Take a set of percentage values and construct a pie chart with
# appropriately sized slices.
require "./SVGTools.rb"  
c = SVGTools.new 

c.emitHeader()

c.setStroke("")

r  = 150
cx = 200
cy = 200
colors = %w{red lightgreen blue orange pink cyan magenta yellow green}
data = ""
points = [cx+r,cy]
values = [10,5,38,27,20]    # Values as percentages.
a = 0
onepct = 360.0/100.0        # One percent of 360

values.each do |v|
  a = a + (onepct * v)  
  points += c.getPointOnCircle(cx,cy,r,a)
end

puts points.length
n = 0
0.step(points.length-4,2) do
  c.setFill(colors[n/2])
  data =  "M #{cx},#{cy} L #{points[n]},#{points[n+1]} "
  data += "A #{r},#{r},0,0,1,#{points[n+2]},#{points[n+3]} z"
  c.drawPath(data) 
  n += 2
end


c.emitFooter()             
