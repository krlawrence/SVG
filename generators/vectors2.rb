require "./SVGTools.rb"

c = SVGTools.new


x1 = ARGV[0].to_f
y1 = ARGV[1].to_f
x2 = ARGV[2].to_f
y2 = ARGV[3].to_f
d  = ARGV[4].to_f

puts "(x1,y1) (#{x1},#{y1})"
puts "(x2,y2) (#{x2},#{y2})"

mag = c.vectorMagnitude(x1,y1,x2,y2)

puts mag
