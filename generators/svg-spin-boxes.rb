require "./SVGTools.rb"

c = SVGTools.new

c.setTitle("Spinning boxes")
c.emitHeader()

cx = 300
cy = 300
r  = 150

c.newGroup( stroke="blue", fill="none")

0.step(360,36) do |a|
  p  = c.getPointOnCircle(cx,cy,r,a)
  x = p[0] - 25
  y = p[1] - 25
  puts "<path d='M #{x},#{y} h50 v50 h-50z' >

          <animateTransform attributeName='transform' 
                            attributeType='XML' 
                            type='rotate'
                            from='0 #{p[0]} #{p[1]}'
                            to='360 #{p[0]} #{p[1]}'
                            dur='5s'
                            repeatCount='indefinite'/>
           </path>"    

end 
c.endGroup()
c.emitFooter()                                                            


