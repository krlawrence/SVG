# Take a set of percentage values and construct a donut chart with
# appropriately sized slices.
#

require "./SVGTools.rb"  
c = SVGTools.new 

c.setTitle("Donut chart")
c.emitHeader()

c.setFill("")

onepct = 360.0/100.0        # One percent of 360   

r1  = 100
r2  = 200
cx  = 300
cy  = 300
a   = 0
#values = [45,15,30,10]           # Values as percentages. Total should equal 100.
values = [15,15,30,10,25,5]       # Values as percentages. Total should equal 100.
values = [2,3,5,10,15,25,20,8,12] # Values as percentages. Total should equal 100.
inner = []
outer = []
colors = %W{coral blanchedalmond chocolate brown orange lightsalmon peru sandybrown tan}

values.each do |v|
  inner += c.getPointOnCircle(cx,cy,r1,a)     
  outer += c.getPointOnCircle(cx,cy,r2,a)     
  a += (onepct * v) 
end
inner += [inner[0],inner[1]]
outer += [outer[0],outer[1]]

c.newGroup(stroke="black")
n = 0
f = 0
0.step(outer.length-4,2) do  
  p  = "M #{inner[n]},#{inner[n+1]} L #{outer[n]},#{outer[n+1]} A #{r2},#{r2},0,0,1,#{outer[n+2]},#{outer[n+3]}"
  p += " L #{inner[n+2]},#{inner[n+3]} A #{r1},#{r1},0,0,0,#{inner[n]},#{inner[n+1]}" 
  c.setFill(colors[f])
  c.drawPath(p)
  n += 2
  f += 1
end

c.endGroup()
c.emitFooter()             


