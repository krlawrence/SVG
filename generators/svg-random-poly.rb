require "./SVGTools.rb"

c = SVGTools.new 

c.setTitle("Randomly generated regular polygon")
c.emitHeader()


PI = Math::PI

r  = 150
cx = 200
cy = 200

if ARGV[0] == nil
  inc = 360.0/10.0
else
  inc = 360.0/ARGV[0].to_f;
end

i = 0

data = ""
points = []

c.newGroup(stroke="black",fill="none",fillopacity="0.8")

0.step(360,inc) do |a|
#270.step(630,inc) do |a|
  x2 = cx + (r*Math.cos(PI*a/180)).round
  y2 = cy + (r*Math.sin(PI*a/180)).round
  points += [x2,y2]
end

n = 0
i = 1
0.step(points.length-4,2) do
  #c.setFill("rgb(#{rand(255)},#{rand(255)},#{rand(255)})")
  #c.setFill((i%2==0) ? "blue" : "red" )
  if i == 1
    fill = "black"
  elsif i == 2
    fill = "purple"
  else
    fill = "yellow"
  end
  c.setFill(fill)

  i += 1
  if i > 3
    i = 1
  end

  data =  "M #{cx},#{cy} L #{points[n]},#{points[n+1]} "
  data += "L #{points[n+2]},#{points[n+3]} z"
  c.drawPath(data) 
  n += 2
end

c.endGroup()
c.emitFooter()
