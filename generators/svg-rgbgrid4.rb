require "./SVGTools.rb"

c = SVGTools.new

c.emitHeader()

#seed = ARGV[0].to_i  

w = 50
h = 30
x = 10
y = 10

b = 255
r = g = 0

#puts "<g stroke='black'>"
puts "<g stroke='none'>"

0.upto 16 do
  0.upto 16 do
    fill = "rgb(#{r},#{g},#{b})"
    puts "<rect x='#{x}' y='#{y}' width='#{w}' height='#{h}' fill='#{fill}'/>"
    x += w-1
    r += 16
  end
  x = 10
  y += h-1
  g += 16
  r = 0
end

puts "</g>"
c.emitFooter

