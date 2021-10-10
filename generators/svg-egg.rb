require "./SVGTools.rb"

c = SVGTools.new

cx = 300
cy = 250
rx = 100
ry = 150

c.emitHeader()

puts "<defs>" 
puts "  <clipPath id='clip1'>"
puts "    <ellipse cx='#{cx}' cy='#{cy}'  rx='#{rx}' ry='#{ry}' />" 
puts "  </clipPath>"  
puts "</defs>" 
  
#c.drawEllipse(cx,cy,rx,ry)  

puts "<g clip-path='URL(#clip1)' fill='none' stroke-width='8' stroke-opacity='0.4'>"

x1 = cx - rx
y1 = cy - ry
x2 = cx + rx
y2 = y1 + ry + ry

y1.upto y2 do |y|
  c.setStroke("rgb(#{rand(255)},#{rand(255)},#{rand(255)})")
  c.drawLine(x1,y,x2,y)
end

puts "</g>"
       
c.emitFooter()                                                            




