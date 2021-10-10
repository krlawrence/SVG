require "./SVGTools.rb"

@c = SVGTools.new 

##
@c.setTitle("Animating circles using SVG")
@c.emitHeader()
@c.setFill("none")
@c.setStroke("")

cx = 400
cy = 400
s  = 20

randomFill = false
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

if ARGV[4] =="rf"
  randomFill = true
end

r = t*inc
if t == 1 
  r = 100
end

fill = "orange"

#rgb = 240
rgb = 255
rgbdelta = rgb/t

t.times do |i|
  @c.setFill("")
  if randomFill
    fill = "rgb(#{rand(255)},#{rand(255)},#{rand(255)})"
    #fill = "rgb(#{rgb},#{rgb},#{rgb})"
    #fill = "rgb(#{rgb},0,0)"
    #rgb -= rgbdelta
  end
  #@c.newGroup( stroke="none",fill="#{fill}",fillopacity="0.3")
  @c.newGroup( stroke="blue",fill="orange",fillopacity="1.0")
  0.step(360-s,s) do |a|
    point = @c.getPointOnCircle(cx,cy,r,a)
    #drawStar(point[0],point[1])
    @c.drawCircle(point[0],point[1],r/2) #This line makes the spiral circles animation.
    #@c.drawCircle(point[0],point[1],15)
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

