require 'nokogiri'
require 'open-uri'

# This function will fetch and parse the stock data
def fetch_stock_data
  url = 'https://finviz.com/quote.ashx?t=AAPL' # example for Apple stock
  doc = Nokogiri::HTML(URI.open(url))

  # Extract some stock data (example)
  price = doc.at_css('.snapshot-td2 b').text.strip
  change = doc.at_css('.snapshot-td2 span').text.strip

  # Return the parsed data
  { price: price, change: change }
end

# Loop to keep fetching the data and displaying it
loop do
  stock_data = fetch_stock_data

  # Clear the console (for Linux/Mac use 'clear', on Windows use 'cls')
  system('clear') || system('cls')

  # Display the stock data
  puts "AAPL Price: $#{stock_data[:price]}"
  puts "Change: #{stock_data[:change]}"

  # Wait for a few seconds before fetching the data again
  sleep 10
end

