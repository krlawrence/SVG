# 
#
require "./SVGTools.rb"
c = SVGTools.new 

if ARGV[0] != nil
  inc = ARGV[0].to_i
else
  inc = 5
end 
c.emitHeader(1000,1000)

puts "<defs>"
puts "    <symbol id='star'>"
puts "    <path  d='M 125,5 155,90 245,90 175,145 200,230" 
puts "                125,180 50,230 75,145 5,90 95,90z'  />"
puts "    </symbol>"
puts "  </defs>"

puts" <g opacity='0.5' stroke='black'>"

0.upto 300 do
  rnd = rand()
  print "    <use xlink:href='#star' transform='translate(#{rand(700)},#{rand(700)}) "
  puts " scale(#{rnd},#{rnd})' fill='rgb(#{rand(255)},#{rand(255)},#{rand(255)})' />" 
end
puts"  </g>"   

c.emitFooter()




