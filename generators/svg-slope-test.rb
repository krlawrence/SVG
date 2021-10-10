require "./SVGTools.rb"
c = SVGTools.new

x1 = -3
y1 = -3
x2 = 0
y2 = -1

if ARGV[0] != nil
  x1 = ARGV[0].to_i
  y1 = ARGV[1].to_i
  x2 = ARGV[2].to_i
  y2 = ARGV[3].to_i
end

slope = c.lineSlope(x1,y1,x2,y2)

puts slope




