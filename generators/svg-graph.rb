require "./SVGTools.rb"


def validate(cx,cy,r, map)
  result = true
  0.upto map.size-1 do |i|
    if ((map[i][0]-cx).abs < r or (map[i][1]-cy).abs < r)
	result = false
	break
    end
  end
  return result
end

c = SVGTools.new 

c.emitHeader(850,450)
c.setFill("")
c.setStroke("")
c.newGroup( stroke="#0000FF",fill="#008888")

r  = 15
width = 800
height = 400  
nodes = 20

map = []

# Note this is not a good algorithm for anything but a small number of nodes
# if the canvas size is small.
1.upto nodes do |i|
  good = false
  while (!good) do
    cx=rand(width)+r+5
    cy=rand(height)+r+5
    good = validate(cx,cy,r,map)
  end

  map += [[cx,cy]]
  c.drawCircle(cx,cy,r)
  c.setFill("white")
  c.setStroke("none")
  c.drawText(cx-5,cy+5,"#{i}")
  c.setFill("")
  c.setStroke("")
end

#0.upto map.size-1 do |i|
#  puts map[i][0],map[i][1]
#end

c.endGroup()

# Produce an HTML table of the coordinates
#

#c.emitFooter()

puts"<table colwidth='5'>"
0.upto map.size-1 do |i|
  puts "<tr>"
  puts "<td><b>#{i+1}:</b></td><td>#{map[i][0]}</td><td>#{map[i][1]}</td>"
  puts "</tr>"
end
puts"</table>"

puts "</body>"
puts "</html>"


