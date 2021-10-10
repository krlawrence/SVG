# Use vectors to calculate a point a certain distance from the start
# point of a given line. 
require "./SVGTools.rb"

c = SVGTools.new


x1 = ARGV[0].to_f
y1 = ARGV[1].to_f
x2 = ARGV[2].to_f
y2 = ARGV[3].to_f
d  = ARGV[4].to_f

puts "(x1,y1) (#{x1},#{y1})"
puts "(x2,y2) (#{x2},#{y2})"

puts "distance to move = #{d}"

# First calculate the vector from (x1,y1) to (x2,y2)
vx = x2 - x1
vy = y2 - y1

puts "vx = #{vx}"
puts "vy = #{vy}"

# Then calculate the length (magnitude) of the given line.
mag = Math.sqrt(vx*vx + vy*vy)

puts "mag = #{mag}"

# Normalize the vector to unit length 
vx /= mag
vy /= mag

puts "vx (normalized vx/mag) = #{vx}"
puts "vy (normalized vy/mag) = #{vy}"

# Finally calculate the new point (vector).
# If we wanted to calculate from the end of the line we could
# replace d with (mag + d) in the two lines below.
px = x1 + vx * d
py = y1 + vy * d

puts "px = #{px}"
puts "py = #{py}"
