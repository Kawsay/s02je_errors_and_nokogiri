require 'nokogiri'
require 'open-uri'
require 'pry'



def scrap_acronyms_and_values
  doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  a = 'aze'
  acronyms = [] # > Will contain all cryptocurrencies acronyms (e.g BTC)
  prices = []   # > Will contain all cryptocurrencies prices (e.g 9000.01)

  doc.xpath('//tbody/tr').each do |cryptocurrencies_full_info| # Select each line of CCM main table

    one_crypto_infos = Nokogiri::HTML(cryptocurrencies_full_info.to_html) # Parse every lines ...
    one_crypto_infos.xpath('//a[@class="link-secondary"]').each do |currency_name| # ... looking for acronyms
      acronyms << currency_name.text # And store it in the related array
    end  

    one_crypto_infos = Nokogiri::HTML(cryptocurrencies_full_info.to_html) # Parse every lines again ...
    one_crypto_infos.search('.price').each do |currency_price| # Looking for price (note : using .search & CSS tag this time)
      prices << currency_price.text # And store it in the related array
    end
  end
  puts acronyms.zip(prices).to_h
  acronyms_and_values = acronyms.zip(prices).to_h # Merge both array (.zip > [[BTC, 5000], [ETH, 160], ...])
                                                  # and transform it into a hash (.to_h > {"BTC => "6000", "ETH" => "160", ...})
end

acronyms_and_values = scrap_acronyms_and_values
