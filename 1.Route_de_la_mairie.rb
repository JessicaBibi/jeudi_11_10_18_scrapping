require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_the_email_of_a_townhal_from_its_webpage(url)
    doc = Nokogiri::HTML(open(url))
    doc.css('table.table tr td').each do |line| #
        email = line.inner_html #  on 
        if /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.match?(line.inner_html) #ca test si (line.inner_html) est bien une adresse mail.
            puts line.inner_html #
        end
    end
end

# get_the_email_of_a_townhal_from_its_webpage
def get_all_the_urls_of_val_doise_townhalls(url)
    doc = Nokogiri::HTML(open(url))
    list = []
    doc.css('//a[class="lientxt"][href]').each {
        |link| list << "http://annuaire-des-mairies.com#{link['href'][1..-1]}"
    }
    return list
end

# on récupère la liste des urls de toutes les villes
list = get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")
# création d'un tableau vide pour stocker les emails
emails = []
#on parcourt la liste des urls récupées grace à la méthode get_all_the_urls_of_val_doise_townhalls
list.each do |url|
    #on stocke chaque email récupéré dans le tableau
    emails << get_the_email_of_a_townhal_from_its_webpage(url)
end
puts emails