$caps = [char[]] "ABCDEFGHJKMNPQRSTUVWXYZ"
$lows = [char[]] "abcdefghjkmnpqrstuvwxyz" 
$nums = [char[]] "012346789"

$first = $nums | Get-Random -count 4;
$second = $caps | Get-Random -count 4;
$third = $lows | Get-Random -count 4
$pwd = [string](@($first) + @($second) + @($third) | Get-Random -Count 12)
$pwd