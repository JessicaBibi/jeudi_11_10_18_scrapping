require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_the_email_of_a_townhal_from_its_webpage
	
	doc = Nokogiri::HTML(open"http://annuaire-des-mairies.com/95/ableiges.html") #
	doc.css('table.table tr td').each do |line| #
		email = line.inner_html #  on 
		if /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.match?(line.inner_html) #ca test si (line.inner_html) est bien une adresse mail.
			puts line.inner_html #
		end
	end
end
get_the_email_of_a_townhal_from_its_webpage #
 


def get_all_the_urls_of_val_doise_townhalls(url)
	doc = Nokogiri::HTML(open(url))
	list = []
	doc.css('//a[class="lientxt"][href]').each{ |link| list << "http://annuaire-des-mairies.com#{link['href'][1..-1]}"}
		
		for i in (1..list.length)
		puts "#{list[i]}"
		puts list
		end

end
get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")









# def get_all_the_emails_of_val_doise_townhalls(url)
# 	doc = Nokogiri::HTML(open(url))
# 	doc.css('//a[class="lientxt"][href]').each{|link| puts link['href']}
# 		town_email = []
# 		doc.css('table.table tr td').each do |line|
			
# 			email = line.inner_html
# 				if /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.match?(line.inner_html) #ca test si (line.inner_html) est bien une adresse mail.
# 				town_email << email 
# 			puts line.inner_html

			
# 			end
# 		end
# 	end
# end
# get_all_the_emails_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")