require 'nokogiri'
require 'open-uri'
require 'pry'

doc = Nokogiri::HTML(open("https://coinmarketcap.com/"))

def scrap_acronyms_and_values(doc)
  
  acronyms = []
  prices = []

  doc.xpath('//tbody/tr').each do |cryptocurrencies_full_info|

    one_crypto_infos = Nokogiri::HTML(cryptocurrencies_full_info.to_html)
    one_crypto_infos.xpath('//a[@class="link-secondary"]').each do |currency_name| # .search('.link-secondary')
      acronyms << currency_name.text
    end  

    one_crypto_infos = Nokogiri::HTML(cryptocurrencies_full_info.to_html)
    one_crypto_infos.search('.price').each do |currency_price|
      prices << currency_price.text
    end
  end
  acronyms_and_values = acronyms.zip(prices).to_h
end