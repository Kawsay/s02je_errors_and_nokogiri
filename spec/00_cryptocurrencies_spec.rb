require_relative '../lib/00_cryptocurrencies'

describe "the scrap_acronyms_and_values function" do
  tester = scrap_acronyms_and_values
  it "return an Hash" do
    expect(tester.class).to eq(Hash)
  end
   it "return at least 1000 currency" do
    expect(tester.length > 1000).to eq(true)
  end
  it "verify that BTC exist" do
    expect(tester.include?('BTC')).to eq(true)
  end
end