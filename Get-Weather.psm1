function Get-Weather {
    param (
        [string]$CityName = 'baku',
        [string]$ApiKey = '51422bd036b87858441a489446da6061'
    )
    $Data = Invoke-RestMethod -Uri "api.openweathermap.org/data/2.5/weather?q=$CityName&appid=$ApiKey"
    $WeatherInformation = [ordered]@{
        "City"                        = $Data.name
        "Id"                          = $Data.id
        "Country"                     = $Data.sys.country
        "Temperature now in  celcius" = $Data.main.temp - 273.15
        "Temperature now in  kelvin"  = $Data.main.temp 
        "Temperature now in imperial" = ($Data.main.temp - 273.15) * 9 / 5 + 32
        "Weather now"                 = $Data.weather.description
    }
    $WeatherInformation
}
# Export-ModuleMember -Function Get-Weather