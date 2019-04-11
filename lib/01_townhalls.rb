require 'nokogiri'
require 'open-uri'
require 'pry'

doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

def scrap_townhall_email(doc)
# > [town_name, town_email] (Array)
  town_name_and_email = [] # Will contain [town_name, town_email]
  town_name_and_email << doc.xpath('/html/body/div/main/section[1]/div/div/div/h1').text.split(' ').first # Scrap + split + select "town_name"
  town_name_and_email << doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text # Scrap town_email
  return town_name_and_email 
end

def scrap_towns_urls(doc)
# > ["URL1", "URL2", ...]
  town_urls = [] # Will contain all URLs
  doc.search('.lientxt').each do |town_name| # Iterate over each scraped element having the class ".lientxt"
    town_urls << 'http://annuaire-des-mairies.com' + town_name["href"][1..-1] #
  end
  return town_urls
end

def scrap_townhalls_emails(doc)
  towns_urls = []
  scrap_towns_urls(doc).each do |town_url|
    towns_urls << scrap_townhall_email(Nokogiri::HTML(open(town_url)))
  end
  puts towns_urls.to_h
end

scrap_townhalls_emails(doc)