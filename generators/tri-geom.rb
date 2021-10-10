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
else
  ax =  50
  ay =  50
  bx = 300
  by = 250
  cx = 350
  cy =  50    
end 

# Calculate the lengths of each line.
lenab = Math.sqrt((bx-ax)**2 + (by-ay)**2)
lenac = Math.sqrt((cx-ax)**2 + (cy-ay)**2)
lenbc = Math.sqrt((cx-bx)**2 + (cy-by)**2)

puts "A:(#{ax},#{ay}) B:(#{bx},#{by}) C:(#{cx},#{cy})"
puts
puts "AB = #{lenab}"
puts "AC = #{lenac}"
puts "BC = #{lenbc}"

#calculate the slope of each line
slopeab = (by-ay+0.0)/(bx-ax+0.0)
slopeac = (cy-ay+0.0)/(cx-ax+0.0)
slopebc = (cy-by+0.0)/(cx-bx+0.0)
puts
puts "Slope AB = #{slopeab}" 
puts "Slope AC = #{slopeac}" 
puts "Slope BC = #{slopebc}" 

# Calculate the midpoint of each line.
midabx = (ax+bx)/2.0
midaby = (ay+by)/2.0
midacx = (ax+cx)/2.0
midacy = (ay+cy)/2.0
midbcx = (bx+cx)/2.0
midbcy = (by+cy)/2.0
puts
puts "Midpoint of AB = (#{midabx},#{midaby}) "
puts "Midpoint of AC = (#{midacx},#{midacy}) "
puts "Midpoint of BC = (#{midbcx},#{midbcy}) "
puts
# Calculate the line equation for each line and also where each line crosses
# the y-axis (if at all). Not the edge cases could be handled better here!
b = -((slopeab*ax)-ay)
puts "Line equation for the line AB: y = #{slopeab}x + #{b} "
b = -((slopeac*ax)-ay)
puts "Line equation for the line AC: y = #{slopeac}x + #{b} "
b = -((slopebc*bx)-by)
puts "Line equation for the line BC: y = #{slopebc}x + #{b} "

#c.emitHeader(2000,1000)


#c.emitFooter()



