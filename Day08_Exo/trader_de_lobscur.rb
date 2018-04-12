require "nokogiri"
require "open-uri"

def get_price_coin(url)
  doc = Nokogiri::HTML(open(url))
  hash_of_crypto = {}
  
  array_crypto_name = doc.css("a.currency-name-container").map { |crypto_name| crypto_name.content }

  array_crypto_value = doc.css("a.price").map { |crypto_value| crypto_value.content }

  for i in 0...array_crypto_name.length
  	hash_of_crypto.store(array_crypto_name[i],array_crypto_value[i])
  end
  p hash_of_crypto
  hash_of_crypto
end

my_crypto_website = "https://coinmarketcap.com/all/views/all/"
get_price_coin(my_crypto_website) #Appel une fois le code

=begin
a = 0
while(a < 1) #Boucle infini que l'on appel pour faire tourner le scrap toutes les heures
  get_price_coin(my_crypto_website)
  sleep(3600) #On attend toutes les heures (3600 secondes)
  a += 1 #On incremente pour pas que ce soir infini (CTRL + C POUR FORCER L ARRET DU PROGRAMME DANS LE TERMINAL) => Pour rendre la boucle infini mettre en commentaire cette partie
end
=end
