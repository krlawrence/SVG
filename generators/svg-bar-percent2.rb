require "./SVGTools.rb"

c = SVGTools.new

c.setTitle("Percentage growth over time")

c.emitHeader(900,900)
c.drawText(50,80,"Growth of $100 over 12 months at 12% per month")
values = []

pc = 12.0
n  = 100.0

12.times do |i|
  #puts "#{i},#{n}"
  values[i] = n
  n += (n/100)*pc
end

c.setStrokeOpacity(0.5)
c.setStroke("#aaaaaa")
c.drawGridRect(50,140,36,38,10)

c.drawBarChart(50,500,values,width=25,spacing=5,axes=true,colors=nil)

c.emitFooter()                                                            
