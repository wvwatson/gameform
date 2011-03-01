require 'RMagick'
class NormalForm
  
  # # makes a skyblue box with hello in it
  # convert -size 100x60 xc:skyblue -fill white -stroke black -font Candice -pointsize 40 -gravity center -draw "text 0,0 'Hello'"  draw_text.gif
  # 
  # # make a rectangle with white fill on skyblue background
  # convert -size 100x60 xc:skyblue -fill white -stroke black -draw "rectangle 20,10, 80,50" draw_rect.gif
  def draw_rectangle (location=File.dirname(__FILE__) + "/../examples/")
    # debugger
    canvas = Magick::Image.new(240, 300,
                  Magick::HatchFill.new('white','lightcyan2'))
    
    myrectangle = Magick::Draw.new
  	myrectangle.fill('white')
    myrectangle.stroke('black')
    myrectangle.rectangle 20, 10, 80, 50
    myrectangle.draw(canvas)
    canvas.write(location + 'rectangle.gif')
    
  end
  # 
  # # draw a line
  # convert -size 100x60 xc:skyblue -fill white -stroke black -draw "line   20,50 90,10" draw_line.gif
  def draw_line(canvas = Magick::Image.new(240, 300,
                            Magick::HatchFill.new('white','lightcyan2')),
                   args={first_x: 20,
                     first_y: 50,
                     second_x: 90,
                     second_y: 10},
                     location=File.dirname(__FILE__) + "/../examples/")
                   
        
       myline = Magick::Draw.new
        myline.fill('white')
       myline.stroke('black')
       myline.line args[:first_x], args[:first_y], args[:second_x],args[:second_y]
       myline.draw(canvas)
       canvas.write(location + 'line.gif')
      
      end
	
  # def draw_line2(mycanvas, options = {})
 		          # mycanvas = Magick::Image.new(240, 300,
 		         #                           Magick::HatchFill.new('white','lightcyan2'))
 		         #                  options={first_x: 20,
 		         #                    first_y: 50,
 		         #                    second_x: 90,
 		         #                    second_y: 10,
 		         #                    location: File.dirname(__FILE__) + "/../examples/"}

                 # location=
 		# canvas = Magick::Image.new(240, 300,
 		#                 Magick::HatchFill.new('white','lightcyan2'))

  #      myline = Magick::Draw.new
  #   myline.fill('white')
  #      myline.stroke('black')
  #      myline.line options[:first_x], options[:first_y], options[:second_x], options[:second_y]
  #      myline.draw(canvas)
  #      mycanvas.write(options[:location] + 'line.gif')
  # 
  # end

	# convert -size 100x60 xc:skyblue -fill white -stroke black -font Candice -pointsize 40 -gravity center -draw "text 0,0 'Hello'"  draw_text.gif
	def draw_annotation(location=File.dirname(__FILE__) + "/../examples/")
    # canvas = Magick::Image.new(240, 300,
    #                 Magick::HatchFill.new('white','lightcyan2'))
    
	  canvas = Magick::Image.new(300, 50) do
        self.background_color = 'none'
    end
  
    myannotation = Magick::Draw.new
		myannotation.fill('black')
    myannotation.stroke('black')
    myannotation.font "Courier-New-Regular"
    myannotation.pointsize 24
    myannotation.gravity Magick::CenterGravity
    myannotation.text 0, 0, 'Hello'
    myannotation.draw(canvas)
    canvas.rotate!(45)
    canvas.write(location + 'annotation.gif')
  end

  # perl example
  # $label=Image::Magick->new(size=>"600x600");
  # $label->Read("label:testing");
  # $label->Write("test.png");
	def draw_label(label_text='Football',
                   args={width: 100,
                     height: 15},
                     location=File.dirname(__FILE__) + "/../examples/")  
       
                  
	  strategy_canvas = Magick::Image.new(args[:width], args[:height]) do
        self.background_color = 'white' # change this to none later
    end
		
   # label_text = "Football"
   label = Magick::Draw.new
   label.font = "Courier-New" # use courier-new for windows and courier for mac
   label.text_antialias(true)
   label.font_style=Magick::NormalStyle
   label.font_weight=Magick::BoldWeight
   label.gravity=Magick::EastGravity
   label.text(0,0,label_text)
   metrics = label.get_type_metrics(label_text)
   width = metrics.width
   height = metrics.height
    # debugger
  	label.draw(strategy_canvas)
  	strategy_canvas.write(location + 'label.gif')
    [width, height, strategy_canvas]
  end

  def draw_foursquare(location=File.dirname(__FILE__) + "/../examples/")
    
    canvas_coordinates={}
    canvas_coordinates[:width]=240
    canvas_coordinates[:height]=300
    
    rectangle_coordinates={}
    rectangle_coordinates[:first_horizontal]=20
    rectangle_coordinates[:first_vertical]=10
    rectangle_coordinates[:second_horizontal]=80
    rectangle_coordinates[:second_vertical]=50
    
    vertical_line={}
    vertical_line[:first_vertical]=rectangle_coordinates[:first_vertical]
    vertical_line[:first_horizontal] = (rectangle_coordinates[:first_horizontal]+
      rectangle_coordinates[:second_horizontal])/2
    vertical_line[:second_vertical]=rectangle_coordinates[:second_vertical]
    vertical_line[:second_horizontal]=vertical_line[:first_horizontal]
    
    horizontal_line={}
    horizontal_line[:first_vertical]=(rectangle_coordinates[:first_vertical]+
      rectangle_coordinates[:second_vertical])/2
    
    horizontal_line[:first_horizontal] = rectangle_coordinates[:first_horizontal]
    horizontal_line[:second_vertical]=horizontal_line[:first_vertical]
    horizontal_line[:second_horizontal]=rectangle_coordinates[:second_horizontal]
    
      
    canvas = Magick::Image.new(canvas_coordinates[:width], 
                              canvas_coordinates[:height],
                              Magick::HatchFill.new('white','lightcyan2'))
    
    myfoursquare = Magick::Draw.new
  	myfoursquare.fill('white')
    myfoursquare.stroke('black')
    myfoursquare.rectangle rectangle_coordinates[:first_horizontal], 
                           rectangle_coordinates[:first_vertical], 
                           rectangle_coordinates[:second_horizontal], 
                           rectangle_coordinates[:second_vertical]
    myfoursquare.line vertical_line[:first_horizontal], 
                      vertical_line[:first_vertical], 
                      vertical_line[:second_horizontal], 
                      vertical_line[:second_vertical]                      
    myfoursquare.line horizontal_line[:first_horizontal], 
                      horizontal_line[:first_vertical], 
                      horizontal_line[:second_horizontal], 
                      horizontal_line[:second_vertical] 
    myfoursquare.draw(canvas) 
    canvas.write(location + 'foursquares.gif')
    
  end
 
 
  # def some_method (thing, options)
  #   options.reverse_merge!({:key1 => 'default'})
  #    puts thing
  #    puts options
  # end
  def draw_annotated_game(location=File.dirname(__FILE__) + "/../examples/")
    
    canvas_coordinates={}
    canvas_coordinates[:width]=240
    canvas_coordinates[:height]=300
    
    canvas = Magick::Image.new(canvas_coordinates[:width], 
                              canvas_coordinates[:height],
                              Magick::HatchFill.new('white','lightcyan2'))
    
    topleft_adjustment = 50
    bottomright_adjustment = 140
    rectangle_coordinates={}
    
    # rip out the line drawing
    
    rectangle_coordinates[:first_horizontal]=20 + topleft_adjustment
    # First_vert = first_horiz/2
    rectangle_coordinates[:first_vertical]=10 + topleft_adjustment
    rectangle_coordinates[:second_horizontal]=80 + bottomright_adjustment
    # second_vert = second_horiz *.625
    rectangle_coordinates[:second_vertical]=50 + bottomright_adjustment
     #     
     vertical_line={}
        vertical_line[:first_vertical]=rectangle_coordinates[:first_vertical]
        vertical_line[:first_horizontal] = (rectangle_coordinates[:first_horizontal]+
          rectangle_coordinates[:second_horizontal])/2
        vertical_line[:second_vertical]=rectangle_coordinates[:second_vertical]
        vertical_line[:second_horizontal]=vertical_line[:first_horizontal]
    
    # debugger
    draw_line canvas, {first_x: vertical_line[:first_horizontal],
                   first_y: vertical_line[:first_vertical],
                   second_x: vertical_line[:second_horizontal],
                   second_y: vertical_line[:second_vertical]}
    # draw_line canvas, {first_x: vertical_line[:first_horizontal], first_y: vertical_line[:first_vertical], second_x: vertical_line[:second_horizontal],  second_y: vertical_line[:second_vertical]}
    # debugger
    # draw_line canvas, {first_x: 20, first_y: 10, second_x: 80, second_y: 50}
    
    horizontal_line={}
    horizontal_line[:first_vertical]=(rectangle_coordinates[:first_vertical]+
      rectangle_coordinates[:second_vertical])/2
    
    horizontal_line[:first_horizontal] = rectangle_coordinates[:first_horizontal]
    horizontal_line[:second_vertical]=horizontal_line[:first_vertical]
    horizontal_line[:second_horizontal]=rectangle_coordinates[:second_horizontal]
    
    draw_line canvas, {first_x: horizontal_line[:first_horizontal],
                   first_y: horizontal_line[:first_vertical],
                   second_x: horizontal_line[:second_horizontal],
                   second_y: horizontal_line[:second_vertical]}
    
    myfoursquare = Magick::Draw.new
  	myfoursquare.fill('none')
    myfoursquare.stroke('black')
    myfoursquare.rectangle rectangle_coordinates[:first_horizontal], 
                           rectangle_coordinates[:first_vertical], 
                           rectangle_coordinates[:second_horizontal], 
                           rectangle_coordinates[:second_vertical]
    # myfoursquare.line vertical_line[:first_horizontal], 
    #                    vertical_line[:first_vertical], 
    #                    vertical_line[:second_horizontal], 
    #                    vertical_line[:second_vertical]                      
    # myfoursquare.line horizontal_line[:first_horizontal], 
    #                         horizontal_line[:first_vertical], 
    #                         horizontal_line[:second_horizontal], 
    #                         horizontal_line[:second_vertical] 
    # myfoursquare.annotate canvas, 100, 100, 20, 50, "Football"
    #20 10 80 50
    # need to figure out the total pointsize of the text
    # maybe pointsize * size of text?
		#replace this is draw label
    strategy_label= "Football" 

    text_coordinates = {}  
    text_coordinates[:pointsize] = 15
    # there is no way strategy size is 120 *and* size of rectangle is 130
    strategy_size= text_coordinates[:pointsize] * strategy_label.size
    # was 90
    # rotated text should *end* at 1/2 of 1/2 the length of the box 
    # and a little higher horizontally
    # this means rotated text should *start* at 
    # label_size - (1/2 of 1/2 of horizontal length) * 1/2 of label size
    # (because of 45 degree rotation)
    # and vertically 1/2 label_size higher than horizontal
    # debugger
    horizontal_length = rectangle_coordinates[:second_horizontal] - 
                          rectangle_coordinates[:first_horizontal]
    text_rotated_vertical_length = strategy_size - ((0.25 * strategy_size) + 
                                        (0.50 * strategy_size))
    text_coordinates[:text_vertical] = rectangle_coordinates[:first_vertical] - 
                                        text_rotated_vertical_length
                                        
    text_rotated_horizontal_length = (0.50 * strategy_size) 
    # was 20                        
    text_coordinates[:text_horizontal] = text_rotated_horizontal_length + 
                                        rectangle_coordinates[:first_horizontal]
    text = Magick::Draw.new
    text.font "Courier-New"
    text.pointsize = 15
    # text.pointsize = text_coordinates[:pointsize]
    # text.gravity = Magick::CenterGravity
    # maybe try to do a fixed length and height of the text (geometry?) and
    # then right-justify with gravity.
    # I guess annotate is supposed to have height/width as well ...
    # looks like I'm supposed to use a label, size it, have it 'best fit',
    # then compose that labels canvas onto images canvas I want
    debugger
    width, height, label_canvas = draw_label
		label_canvas= label_canvas.rotate 45
		canvas.composite!(label_canvas, text_coordinates[:text_horizontal],
																		text_coordinates[:text_vertical],
																		Magick::OverCompositeOp)
    # text.annotate(canvas, 0,0,text_coordinates[:text_horizontal],
                            # text_coordinates[:text_vertical],
                             # strategy_label) {
       # self.font "Courier-New-Regular"
       # self.fill = 'gray40'
       # self.rotation = 45
    # }
    
    
    
    myfoursquare.draw(canvas)  
    canvas.write(location + 'annotatedgame.gif')    
      #   
      #     canvas = Magick::Image.new(300, 50) do
      #         self.background_color = 'none'
      #     end
      #   
      #     myannotation = Magick::Draw.new
      # myannotation.fill('black')
      #     myannotation.stroke('black')
      #     myannotation.font "Arial"
      #     myannotation.pointsize 25
      #     myannotation.gravity Magick::CenterGravity
      #     myannotation.text 0, 0, 'Hello'
      #     myannotation.draw(canvas)
      #     canvas.rotate!(45)
      #     canvas.write(location + 'annotation.gif')
    
  end
 
  def lolcat

    img = ImageList.new('public/computer-cat.jpg')
    txt = Draw.new
    img.annotate(txt, 0,0,0,0, "In ur Railz, annotatin ur picz."){
    txt.gravity = Magick::SouthGravity
    txt.pointsize = 25
    txt.stroke = '#000000'
    txt.fill = '#ffffff'
    txt.font_weight = Magick::BoldWeight
    }
    
    img.format = 'jpeg'
    send_data img.to_blob, :stream => 'false', :filename => 'test.jpg', :type => 'image/jpeg', :disposition => 'inline'

	end
end