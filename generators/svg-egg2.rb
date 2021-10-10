require "./SVGTools.rb"

c = SVGTools.new

cx = 300
cy = 250
rx = 100
ry = 150
sw = 20
c.emitHeader()

puts "<defs>" 
puts "  <clipPath id='clip1'>"
puts "    <ellipse cx='#{cx}' cy='#{cy}'  rx='#{rx}' ry='#{ry}' />" 
puts "  </clipPath>"  
puts "</defs>" 
  
#c.drawEllipse(cx,cy,rx,ry)  

i = 0
colors = ["violet","gold","aquamarine","blue"]
puts "<g clip-path='URL(#clip1)' fill='none' stroke-width='#{sw}' stroke-opacity='0.4'>"
#puts "<g  fill='none' stroke-width='20' stroke-opacity='0.6'>"

x1 = cx - rx
y1 = cy - ry
x2 = cx + rx
y2 = y1 + ry + ry


#y1.upto y2 do |y|
y1.step(y2,sw) do |y|
  c.setStroke(colors[i])

  i += 1
#puts i
  if i >= colors.length
    i = 0
  end

  c.drawLine(x1,y,x2,y)
end

puts "</g>"
       
c.emitFooter()                                                            





