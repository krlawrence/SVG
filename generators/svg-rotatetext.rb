require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
c.setStroke("")
c.setFill("")
txt = "      Rotated text"

0.step(340,20) do |i|
  puts"<text x='200' y='200' font-size='24' xml:space='preserve' transform='translate(200,200) rotate(#{i}) translate(-200,-200)'>#{txt}</text>"  
end
c.emitFooter()   
