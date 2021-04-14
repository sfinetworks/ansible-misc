#!/usr/bin/pwsh
param(
  [string]$vcenter,
  [string]$username,
  [string]$password,
  [string]$template
)
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false -Scope User -ParticipateInCEIP:$false | Out-Null
Connect-VIServer -Server $vcenter -Protocol https -User $username -Password $password | Out-Null
$pattern = 'img_' + $template
Get-Template -Name $pattern* | Select-Object -ExpandProperty Name | Select-Object -Last 1
