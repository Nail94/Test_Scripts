<#
  .SYNOPSIS
  Performs monthly data updates.

  .DESCRIPTION
  The Update-Month.ps1 script updates the registry with new data generated
  during the past month and generates a report.

  .PARAMETER InputPath
  Specifies the path to the CSV-based input file.

  .PARAMETER OutputPath
  Specifies the name and path for the CSV-based output file. By default,
  MonthlyUpdates.ps1 generates a name from the date and time it runs, and
  saves the output in the local directory.

  .INPUTS
  None. You cannot pipe objects to Update-Month.ps1.

  .OUTPUTS
  None. Update-Month.ps1 does not generate any output.

  .EXAMPLE
  C:\PS> .\Update-Month.ps1

  .EXAMPLE
  C:\PS> .\Update-Month.ps1 -inputpath C:\Data\January.csv

  .EXAMPLE
  C:\PS> .\Update-Month.ps1 -inputpath C:\Data\January.csv -outputPath C:\Reports\2009\January.csv
#>

param (
    [string]$CityName = 'baku',
    [string]$ApiKey = '51422bd036b87858441a489446da6061'
)
$Data = Invoke-RestMethod -Uri "api.openweathermap.org/data/2.5/weather?q=$CityName&appid=$ApiKey"
$WeatherInformation = [ordered]@{
    "City" = $Data.name
    "Id" = $Data.id
    "Country" = $Data.sys.country
    "Temperature now in  celcius" = $Data.main.temp - 273.15
    "Temperature now in  kelvin" = $Data.main.temp 
    "Temperature now in imperial" = ($Data.main.temp - 273.15) * 9/5 + 32
    "Weather now" = $Data.weather.description
}
$WeatherInformation