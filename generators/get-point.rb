require "./SVGTools.rb"

c = SVGTools.new 


x = ARGV[0].to_i
y = ARGV[1].to_i
r = ARGV[2].to_i
a = ARGV[3].to_i


points = c.getPointOnCircle(x,y,r,a)

puts "x = #{points[0]}"
puts "y = #{points[1]}"


