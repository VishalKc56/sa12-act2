require 'httparty'
require 'json'

def fetch_crypto_prices
  url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"
  response = HTTParty.get(url)
  JSON.parse(response.body)
end

cryptos = fetch_crypto_prices
sorted_cryptos = cryptos.sort_by { |crypto| -crypto['market_cap'] }

puts "Top 5 Cryptocurrencies by Market Capitalization:"
sorted_cryptos.first(5).each_with_index do |crypto, index|
  puts "#{index+1}. #{crypto['name']} - $#{crypto['current_price']} (Market Cap: $#{crypto['market_cap']})"
end