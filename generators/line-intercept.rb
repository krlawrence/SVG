# 
#
# 

require "./SVGTools.rb"
c = SVGTools.new 

if ARGV[0] != nil
  ax = ARGV[0].to_i
  ay = ARGV[1].to_i
  bx = ARGV[2].to_i
  by = ARGV[3].to_i
  cx = ARGV[4].to_i
  cy = ARGV[5].to_i
  dx = ARGV[6].to_i
  dy = ARGV[7].to_i
else
  ax =  0
  ay =  0
  bx =  100
  by =  100
  cx =  200
  cy =  0
  dx =  75
  dy =  75
end 

# Calculate the lengths of each line.
lenab = Math.sqrt((bx-ax)**2 + (by-ay)**2)
lencd = Math.sqrt((cx-dx)**2 + (cy-dy)**2)

puts "A:(#{ax},#{ay}) B:(#{bx},#{by}) C:(#{cx},#{cy}) D:(#{dx},#{dy})"
puts
puts "Length of AB: #{lenab}"
puts "Length of CD: #{lencd}"

#calculate the slope of each line
slopeab = (by-ay+0.0)/(bx-ax+0.0)
slopecd = (dy-cy+0.0)/(dx-cx+0.0)
puts
puts "Slope AB = #{slopeab}" 
puts "Slope CD = #{slopecd}" 

# Calculate the midpoint of each line.
midabx = (ax+bx)/2.0
midaby = (ay+by)/2.0
midcdx = (cx+dx)/2.0
midcdy = (cy+dy)/2.0
puts
puts "Midpoint of AB = (#{midabx},#{midaby}) "
puts "Midpoint of AC = (#{midcdx},#{midcdy}) "
puts
# Calculate the line equation for each line and also where each line crosses
# the y-axis (if at all). Not the edge cases could be handled better here!
b = -((slopeab*ax)-ay)
puts "Line equation for the line AB: y = #{slopeab}x + #{b} "
b = -((slopecd*cx)-cy)
puts "Line equation for the line CD: y = #{slopecd}x + #{b} "

#c.emitHeader(2000,1000)


#c.emitFooter()



