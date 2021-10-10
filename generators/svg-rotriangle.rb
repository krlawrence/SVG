require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()

#cx  = 200
#cx  = 300
#cy  = 100
#cy  = 200
cx = (ARGV[0] == "" ? 300: ARGV[0].to_i)
cy = (ARGV[1] == "" ? 300: ARGV[1].to_i)
c.newGroup(stroke="blue", fill="none")
0.step(360,10) do |a|
  print "<path d='m200,300 h200 l-100,-200 z'"
  #print "<path d='m200,200 h200 l-100,-200 z'"
  #print " transform='translate(100,100) rotate(#{a} #{cx} #{cy})'"
  print " transform='rotate(#{a} #{cx} #{cy})'"
  puts " />"
end

c.endGroup()
c.emitFooter()
