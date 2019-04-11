require_relative '../lib/01_townhalls'
require 'nokogiri'


describe "the scrap_townhalls_emails function" do
  tester = scrap_townhalls_emails(doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html")))
  it "return an Hash" do
    expect(tester.class).to eq(Hash)
  end
   it "return at least 100 cities" do
    expect(tester.length > 100).to eq(true)
  end
  it "verify that BEAUCHAMP exist" do
    expect(tester.select {|k , v| k.match("BEAUCHAMP")}).to eq({"BEAUCHAMP"=>"accueil-mairie@ville-beauchamp.fr"})
  end
end