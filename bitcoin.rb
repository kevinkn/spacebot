require 'json'
require 'uri'
require 'net/http'

$currencies = ["USD", "GBP", "EUR"]
$info = "This data was produced from the " +
        "CoinDesk Bitcoin Price Index. " +
        "Non-USD currency data converted using " + 
	"hourly conversion rate from " + 
        "openexchangerates.org."

def checkBTC(arg)
  if arg == "help"
    return help
  elsif arg == "info"
    return ofni
  elsif ccheck(arg) == true 
    return getPrice(arg)
  else
    return "Leider hat da etwas nicht geklappt. Versuche es mal mit '!bitcoin help'."
  end
end

def ccheck(c)
  if $currencies.include?(c)
    return true
  end
end

def getPrice(c)
  api = "http://api.coindesk.com/v1/bpi/currentprice.json"
  uri = URI.parse(api)
  response = Net::HTTP.get_response(uri)
  data = response.body

  result = JSON.parse(data)
  @price = result["bpi"]["#{c}"]["rate_float"]
  return "Ein Bitcoin ist #{@price} #{c} wert."
end

def help
  return "The princess is in another castle. Try '!help bitcoin'."
end

def ofni
  return $info
end
