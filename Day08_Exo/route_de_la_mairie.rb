require "nokogiri"
require "open-uri"

def get_the_email_of_a_townhall_from_this_webpage(url)
  doc = Nokogiri::HTML(open(url)) #On recupere la page à observer
  my_email = doc.css("td:contains('@')").map { |email| email.content } #On recupere la valeur comprenant "@" sur la page html
  #p "My email is : #{my_email}" #Result
  my_email
end

my_town = "http://annuaire-des-mairies.com/95/vaureal.html"
#get_the_email_of_a_townhall_from_this_webpage(my_town)

def get_the_name_of_town(url)
  doc = Nokogiri::HTML(open(url))
  hash_of_town_email = {}
  array_of_town = doc.css("a.lientxt").map { |town| town.content }
  array_of_town_website = array_of_town.map do |sentence| #On remplace les " " par des "-" et on downcase pour bien écrire les urls
  	town_website = ""
  	sentence.chars.map do |char|
      char = char.gsub " ","-" #Remplace les " " avec "-"
      town_website += char.downcase
  	 end
    town_website
  end
  array_of_town_website.each do |website| #On appel la fonction get_the_email_townhall pour récupérer les emails de chaque ville
  	my_website = "http://annuaire-des-mairies.com/95/" + website + ".html"
  	hash_of_town_email.store(website , get_the_email_of_a_townhall_from_this_webpage(my_website))
  end
  p hash_of_town_email #Result
  hash_of_town_email
end

my_region = "http://annuaire-des-mairies.com/val-d-oise.html"
get_the_name_of_town(my_region)