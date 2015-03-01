require 'flickraw'
require 'highline/import'
require 'clipboard'

FlickRaw.api_key = 'YOUR_OWN'
FlickRaw.shared_secret = 'YOUR_OWN'

#photoset_id = "72157651083444372"
user_id = "YOUR_OWN"

puts "**********"
puts "Flickr Photoset HTML generator by @nathanbirrell"
puts "**********"

photoset_id = ask("Photoset ID:  ")

puts "1. Fetching photos for photoset ID: " + photoset_id
photos = flickr.photosets.getPhotos(:photoset_id => photoset_id, user_id => user_id, :extras => 'title,url_o')

puts "2. About to generate your HTML for all " + photos.total + " photos in Photoset: " + photos.title + "\n \n"
i = 0
total = photos.total.to_i
html = ""

while i < total
	photo = photos.photo[i]

	puts "Adding photo " + i.to_s + " - " + photo.title

	html += '<img src="' + photo.url_o + 
				'" title="' + photos.title + ' - ' + photo.title + 
				'" alt="' + photo.title + '" />' + 
				"\n \n"

	i += 1
end

puts "\n ================================================ \n \n"

puts html

puts "\n \n ================================================ \n"

Clipboard.copy(html)

puts "3. HTML has been copied to clipboard!"