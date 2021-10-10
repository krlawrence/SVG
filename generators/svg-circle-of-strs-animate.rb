require "./SVGTools.rb"

@c = SVGTools.new 

def drawStar(cx,cy)
r    = 15
step = 20

0.step(360,step) do |a|
  point = @c.getPointOnCircle(cx,cy,r,a)
  @c.drawLine(cx,cy,point[0],point[1])
end                
end

##

@c.emitHeader()
@c.setFill("none")
@c.setStroke("")

cx = 400
cy = 400
s  = 20

twoWay = false
variableSpeed = false

if ARGV[0] != nil 
  t = ARGV[0].to_i
else
  t = 5
end


if ARGV[1] == "2"
  twoWay = true
end

if ARGV[2] == "v"
  variableSpeed = true
end

inc = 50
if ARGV[3] != nil
  inc = ARGV[3].to_i
end
r = t*inc

if t == 1 
  r = 100
end

t.times do |i|
  @c.newGroup( stroke="blue")
  0.step(360,s) do |a|
    point = @c.getPointOnCircle(cx,cy,r,a)
    drawStar(point[0],point[1])
  end                
  r -= inc

start = 0
stop = 360

if twoWay
  if i%2 == 0
    start = 0
    stop  = 360
  else
    start = 360
    stop  = 0
  end
end

dur = 5
if variableSpeed
  dur = t*2-i*2
end

  puts "    <animateTransform attributeName='transform' attributeType='XML'
             type='rotate' from='#{start} #{cx} #{cy}' to='#{stop} #{cx} #{cy}' begin='0s' dur='#{dur}s'
             repeatCount='indefinite' />"
  @c.endGroup()
  
end

@c.emitFooter()

