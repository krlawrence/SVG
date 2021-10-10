
#seed = ARGV[0].to_i  

puts "<html>"
puts "<head>"
puts "<meta name='description' content='Machine generated SVG using a Ruby script.' />"
puts "<meta name='author' content='Kelvin R. Lawrence' />"
puts "</head>"
puts "<body>"
puts"<svg xmlns='http://www.w3.org/2000/svg' version='1.1' width='1000' height='1000'>"

def drawGrid( x,y,nlines,gapsz)
  x1 = x
  x2 = x1 + (nlines*gapsz)
  y1 = y2 = y

  puts "<g stroke='black' fill='none' stroke-width='1'>"

  0.upto nlines do
    puts "<line x1='#{x1}' y1='#{y1}' x2='#{x2}' y2='#{y1}' />"
    y1 += gapsz
  end

  x1 = x
  y1 = y
  y2 = y1 + (nlines*gapsz)

  0.upto nlines do
    puts "<line x1='#{x1}' y1='#{y1}' x2='#{x1}' y2='#{y2}' />"
    x1 += gapsz
  end

  puts "</g>"
end

drawGrid(10,10,20,20)
puts "<circle cx='200' cy='200' r='100' fill='red' fill-opacity='0.5' />"
drawGrid(500,10,20,15)
puts "<path d='M580,80 h150 l-75,150 z' fill='blue' fill-opacity='0.5'/>"

puts "</svg>"
puts "</body>"
puts "</html>"               
