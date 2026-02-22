<#
.SYNOPSIS
	xyOps Join notification plugin - Sends a Join notification via API.

.NOTES
	Author:         Nick Dollimount
	Copyright:      2026

	Please see the README.md file for full documentation.
#>

# MARK: Send-JoinMessage
function Send-JoinMessage {
    param(
        [Parameter(Mandatory = $true)][string]$DeviceID,
        [Parameter(Mandatory = $true)][string]$APIKey,
        [Parameter(Mandatory = $true)][string]$Title,
        [Parameter(Mandatory = $true)][string]$Text,
        [Parameter(Mandatory = $false)][string]$Uri
    )

    $notificationUri = "https://joinjoaomgcd.appspot.com/_ah/api/messaging/v1/sendPush?apikey=$($APIKey)&text=$([System.Web.HttpUtility]::UrlEncode($Text))&title=$([System.Web.HttpUtility]::UrlEncode($Title))$((-not [string]::IsNullOrEmpty($Uri)) ? ('&url=' + [System.Web.HttpUtility]::UrlEncode($Uri)) : '')&deviceId=$($DeviceID)"

    try {
        $results = Invoke-RestMethod -Uri $notificationUri | ConvertTo-Json -Depth 100 -Compress
        Write-Information -MessageData ([PSCustomObject]@{
            xy = 1
            code = 0
            description = "Join notification sent successfull!"
            details = $results
        } | ConvertTo-Json -Depth 100 -Compress) -InformationAction Continue
    }
    catch {
        Write-Information -MessageData ([PSCustomObject]@{
            xy = 1
            code = 9
            description = "Join notification failed!"
            details = $results
        } | ConvertTo-Json -Depth 100 -Compress) -InformationAction Continue
    }
}

# MARK: Begin

[PSCustomObject]$xyOps = ConvertFrom-Json -Depth 100 (Read-Host)

$joinDeviceID = $xyOps.secrets."$($xyOps.params.deviceidvariable)"
$joinApiKey = $xyOps.secrets."$($xyOps.params.apikeyvariable)"

if (-not [string]::IsNullOrEmpty($xyOps.params.joinnotificationtext)) {
    $joinNotificationText = $xyOps.params.joinnotificationtext
}
else {
    $joinNotificationText = $xyOps.text
}

if (-not [string]::IsNullOrEmpty($xyOps.params.joinnotificationtitle)) {
    $joinNotificationTitle = $xyOps.params.joinnotificationtitle
}
else {
    $joinNotificationTitle = "xyOps Alert"
}

if (-not [string]::IsNullOrEmpty($xyOps.params.joinnotificationuri)) {
    $joinNotificationUri = $xyOps.params.joinnotificationuri
}
else {
    $joinNotificationUri = $xyOps.links.job_details
}

Send-JoinMessage -DeviceID $joinDeviceID -APIKey $joinApiKey -Title $joinNotificationTitle -Text $joinNotificationText -Uri $joinNotificationUri