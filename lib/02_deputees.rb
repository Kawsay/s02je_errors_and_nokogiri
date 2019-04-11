require 'nokogiri'
require 'open-uri'
require 'pry'

# ~ 30 minutes avec un Intel(R) Core(TM) i7-2640M CPU @ 2.80GHz en Wifi (+ fibre)
# cat /proc/cpuinfo
# HF <3 

doc = Nokogiri::HTML(open('http://www2.assemblee-nationale.fr/deputes/liste/tableau'))

def scrap_all_deputees_urls(doc)
# Return an Array representing URLs (= Strings) corresponding to every deputees webpage
# e.g. "http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA722260"
  deputees_urls = [] # Will contain all URLs
  doc.css('tbody @href').each do |deputee| # Target using CSS
     deputees_urls << 'http://www2.assemblee-nationale.fr' + deputee.text # Push it into our array
  end
  return deputees_urls # return the whole array
end

def scrap_deputee_email(doc)
# Return an Array containing [deputee_name, deputee_email]
  deputee_name_and_email = [] 
  deputee_name_and_email << doc.xpath('/html/body/div[3]/div/div/div/section[1]/div/article/div[2]/h1').text # Scrap deputee_name
  deputee_name_and_email << doc.xpath('/html/body/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a').text # Scrap deputee_email
  return deputee_name_and_email # e.g. [deputee_name, deputee_email]
# Not exactly what asked :^). Will work on a RegEx to split firstnames / lastnames
end

def scrap_deputees_emails(doc)
# Return a Hash containing {"deputee_name" => "deputee_email", "deputee_name" => "deputee_email", ...}
  deputees_names_and_emails = [] # Will [[deputee_name, deputee_email], [deputee_name, deputee_email], ...]
  scrap_all_deputees_urls(doc).each do |deputee_url| # Iterate through URLs
    deputees_names_and_emails << scrap_deputee_email(Nokogiri::HTML(open(deputee_url))) # Push [deputee_name, deputee_email] for each deputee (URL)
  end
  puts deputees_names_and_emails.to_h # Use to_h to transform nested Arrays into Hash
end

scrap_deputees_emails(doc)