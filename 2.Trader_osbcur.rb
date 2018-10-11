# Va sur CoinMarketCap et fait un programme qui va récupérer le cours de 
# toutes les cryptomonnaies, et les enregistrer bien proprement dans une 
# array de hashs.
require 'rubygems'
require 'nokogiri'
require 'open-uri'

def scrapp_cryptocoin
	doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
	values = [] # On crée un tableau vide pour stocker les valeurs
	doc.css('table tr[id*="id-"]').each do |line|
			price = line.css('td')[4].css('a').inner_html # On récupère la liste des valeurs (price & brand)
			brand = line.css('td')[1].css('a')[1].inner_html
			values << { brand => price } #On stocke chaque valeurs récupéré dans le tableau
		end

		puts values

		return values # Pourquoi les valeures ne veut-elle pas s'afficher..?
	end