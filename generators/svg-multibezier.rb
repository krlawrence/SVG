require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()     

y1 = 100
x1 = 50 
xdelta = 200
ydelta = 200
width = 20

puts "<g fill='none' stroke-width='#{width}'>"

25.times do |i|
  d = "M#{x1},#{y1} c 0,#{ydelta},#{xdelta},#{0},#{xdelta},#{ydelta}"
  stroke = (i%2 == 0) ? "red" : "yellow"
  puts "<path d='#{d}'  stroke='#{stroke}' />" 
  x1 += width
end

puts "</g>"

c.emitFooter()

