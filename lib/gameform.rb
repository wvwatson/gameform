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
  def draw_line(location=File.dirname(__FILE__) + "/../examples/")
		canvas = Magick::Image.new(240, 300,
								Magick::HatchFill.new('white','lightcyan2'))
	
    myline = Magick::Draw.new
		myline.fill('white')
    myline.stroke('black')
    myline.line 20, 50, 90,10
    myline.draw(canvas)
    canvas.write(location + 'line.gif')
	
	end
	
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
    myannotation.font "Arial"
    myannotation.pointsize 25
    myannotation.gravity Magick::CenterGravity
    myannotation.text 0, 0, 'Hello'
    myannotation.draw(canvas)
    canvas.rotate!(45)
    canvas.write(location + 'annotation.gif')
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
    
    myfoursquare.draw(canvas)
    canvas.write(location + 'foursquares.gif')
    
    #     canvas = Magick::Image.new(240, 300,
    #             Magick::HatchFill.new('white','lightcyan2'))
    #   
    #     myline = Magick::Draw.new
    # myline.fill('white')
    #     myline.stroke('black')
    #     myline.line 20, 50, 90,10
    #     myline.draw(canvas)
    #     canvas.write(location + 'line.gif')
    
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