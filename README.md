# s02je_nokogiri

## 00_cryptocurrencies
Scrap CMC, return a Hash {"BTC" => "5000", ...}
What I think I could improve : 
<ul>
  <li>Convert value to float</li>
  <li>Remove XRP and EOS</li>
 </ul>
 
 ## 01_townhalls
 Scrap <a href="http://annuaire-des-mairies.com">a townhall list</a>, return a Hash {"Town_Name" => "Town_Email", ...}
 
 ## 02_deputees
 Scrap <a href="http://www2.assemblee-nationale.fr/deputes/liste/tableau">the assembly website</a>, return a Hash {"Deputee_Name" => "Deputee_email"}
 What I think I could improve :
 <ul>
  <li>gsub/RegEx to isolate firstname/lastname</li>
  <li>Downcase the name of a deputee if he belong to a neoliberal/conservative party</li>
  <li><b>make it faster</b><li>
 </ul>
