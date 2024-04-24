require 'httparty'
require 'json'

area = 'Europe'
location = 'London'  

def fetch_time(area, location)
  url = "http://worldtimeapi.org/api/timezone/#{area}/#{location}"
  response = HTTParty.get(url)
  JSON.parse(response.body)
end

time_data = fetch_time(area, location)
if time_data && time_data['datetime']
  current_time = Time.parse(time_data['datetime'])
  puts "The current time in #{area}/#{location} is #{current_time.strftime('%Y-%m-%d %H:%M:%S')}"
else
  puts "Failed to retrieve time data."
end