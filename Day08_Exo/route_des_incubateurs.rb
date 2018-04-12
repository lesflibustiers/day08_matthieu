require "nokogiri"
require "open-uri"

def get_the_incub_information(url)
  doc = Nokogiri::HTML(open(url))
  url_sub = ""
  array_incub_name = doc.css('div.s-e-title-c h3').map { |each_name| each_name.content }
  
  array_incub_name_sub = array_incub_name.map do |incub_name|
  	incub_name = incub_name.chars
  	incub_name.pop
  	incub_name.shift
  	incub_name.each
  	incub_name = incub_name.join("").gsub " ","-"
  	incub_name = incub_name.gsub "é","e"
  	incub_name = incub_name.downcase
  end

  array_incub_name_sub[array_incub_name_sub.length - 1] = "le-hub-bpifrance" #my_exception
  array_incub_name_sub

  array_incub_name_sub.each do |incub_name|
    url_sub = "http://lespepitestech.com/startup-de-la-french-tech/" + incub_name
    doc_sub = Nokogiri::HTML(open(url_sub))
    array_incub_website = doc_sub.css('div.topVote').map { |each_website| each_website }
  end

  p array_incub_website

end

my_url = "http://lespepitestech.com/startup-collection/incubateur"
get_the_incub_information(my_url)