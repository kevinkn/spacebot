require 'json'
require 'uri'
require 'net/http'
require 'date'

def getKlima
  uri = URI.parse('http://spaceapi.hasi.it')  
  response = Net::HTTP.get_response(uri)
  data = response.body
  
  result = JSON.parse(data)
  
  @temperature = result["sensors"]["temperature"].first["value"]
  @airpressure = result["sensors"]["barometer"].first["value"]
  
  response = "Im HaSi sind es angenehme #{@temperature}°C und der Luftdruck beträgt #{@airpressure}hPa." 
  return response
  
  sleep 1.337
end



