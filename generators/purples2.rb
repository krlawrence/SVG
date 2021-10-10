# Generates rectangles filled with an incremental RGB scale from Red to Blue
#
# Usage: purples2 <increment> <start % red> <end % red> <bar-width> <circles>

require "./SVGTools.rb"
c = SVGTools.new 

if ARGV[0] != nil
  inc = ARGV[0].to_i
else
  inc = 5
end 

if ARGV[1] != nil
  start = ARGV[1].to_i
else
  start = 100
end  

if ARGV[2] != nil
  stop = ARGV[2].to_i
else
  stop = 0
end  

if ARGV[3] != nil
  width = ARGV[3].to_i
else
  width = 40
end   

if ARGV[4] != nil
  circles = true
else
  circles = false
end 

c.emitHeader(2000,1000)

x = 50
y = 100

r = start
b = 100 - start
g = 0

h = 100

c.newGroup(stroke="black", fill="black") 
until ( r < stop )
  c.setFill("rgb(#{r}%,#{g}%,#{b}%)")
  c.drawRect(x,y,width,h)
  c.setFill("")
  c.drawText(x+(width/3)-4,y+h+20,"#{r}")
  b += inc
  r -= inc
  x += width
end
c.endGroup()

if ( circles )
  puts "<circle cx='200' cy='500' r='100' fill='red' />" 
  puts "<circle cx='475' cy='500' r='100' fill='rgb(50%,0%,50%)' />" 
  puts "<circle cx='775' cy='500' r='100' fill='blue' />" 
end

c.emitFooter()


