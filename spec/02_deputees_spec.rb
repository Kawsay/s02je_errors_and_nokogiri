require_relative '../lib/02_deputees'
require 'nokogiri'


describe "the scrap_deputees_emails function" do
  tester = scrap_deputees_emails(doc = Nokogiri::HTML(open('http://www2.assemblee-nationale.fr/deputes/liste/tableau')))
  it "return an Hash" do
    expect(tester.class).to eq(Hash)
  end
   it "return at least 500 deputies" do
    expect(tester.length > 500).to eq(true)
  end
  it "verify that M. Joachim Son-Forget exist and has a value" do
    expect(tester.select {|k, v| k.match("M. Joachim Son-Forget")}).to eq({"M. Joachim Son-Forget"=>"joachim.son-forget@assemblee-nationale.fr"})
  end
end