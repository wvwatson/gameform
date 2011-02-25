require 'RMagick'
class NormalForm
  
  # # makes a skyblue box with hello in it
  # convert -size 100x60 xc:skyblue -fill white -stroke black -font Candice -pointsize 40 -gravity center -draw "text 0,0 'Hello'"  draw_text.gif
  # 
  # # make a rectangle with white fill on skyblue background
  # convert -size 100x60 xc:skyblue -fill white -stroke black -draw "rectangle 20,10 80,50" draw_rect.gif
  def draw_game
    canvas = Magick::Image.new(240, 300,
                  Magick::HatchFill.new('white','lightcyan2'))
    
    rectangle = Magick::Draw.new
    rectangle.stroke('black')
    rectangle.rectangle (20,10, 80,50)
    rectangle.draw(canvas)
    canvas.write('rectangle.gif')
    
    
  end
  # 
  # # draw a line
  # convert -size 100x60 xc:skyblue -fill white -stroke black -draw "line   20,50 90,10" draw_line.gif
  
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