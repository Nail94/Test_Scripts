Try {
    $logs = Get-Content -Path ".\module4-task1-dism.log"
    foreach ($log in $logs) {
        if ( $log -match 'Error') {
            $log | Out-File .\Info-log.log -Append
        }
    }
}
Catch {
    Write-Host $_
}