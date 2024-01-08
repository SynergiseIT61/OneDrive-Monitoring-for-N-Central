try {
    Unblock-File -Path C:\ODTool\OneDriveLib.dll
    Import-Module C:\ODTool\OneDriveLib.dll

    $onedriveProcess = Get-Process -Name OneDrive -ErrorAction SilentlyContinue

    if ($onedriveProcess) {
        $Results = Get-ODStatus
        $ResultsOutput = $Results | Select LocalPath, StatusString
        $ResultsOutput | Export-CSV C:\ODTool\SyncStatus.csv -NoTypeInformation
    } else {
        $ResultsOutput = New-Object PSObject -Property @{
            Message = "OneDrive is not running."
        }
        $ResultsOutput | Export-CSV C:\ODTool\SyncStatus.csv -NoTypeInformation
    }

} catch {
    $_.Exception.Message | Out-File -FilePath C:\ODTool\ErrorLog.txt -Append
}