require './image_array.rb'

#Asks user for file input#

puts "This is an image manipulator."
print "What is your image file name? (Include .png/jpg) "

#Saves file name as 'recieved_file_name'#

received_file_name = gets.chomp

#Opens user input file#

image_file = ImageArray.new(received_file_name)

#Asks what to change about the image?#

puts "What would you like to do to this image?"
puts "Enter 'neg' for a negative image"
puts "Enter 'bw' for a black and white image"
puts "Enter 'bt' for blue tint."

option = gets.chomp.downcase

#Executes the option that the user chose#

if option == 'neg'
	image_file.each do |row|
		row.each do |pixel|
			pixel.red = image_file.max_intensity - pixel.red
			pixel.green = image_file.max_intensity - pixel.green
			pixel.blue = image_file.max_intensity - pixel.blue
		end
	end
elsif option == 'bw'
	image_file.each do |row|
		row.each do |pixel|
			pixel_gray = pixel.red + pixel.blue + pixel.green / 3
			pixel.red = pixel_gray
			pixel.green = pixel_gray
			pixel.blue = pixel_gray
		end
	end
elsif option == 'bt'
	image_file.each do |row|
		row.each do |pixel|
			pixel.red = pixel.red - pixel.red
			pixel.green = pixel.green - pixel.green
		end
	end
end

#Writes the file as a png#

image_file.write("./newpicture.png")
puts "Your picture was saved as 'newpicture.png'"
