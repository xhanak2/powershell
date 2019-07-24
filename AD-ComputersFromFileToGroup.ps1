# Add computers to security group
$comps = Get-Content C:\Temp\McAfee\mcafee2.txt
$creds=Get-Credential
foreach ($comp in $comps)
{Add-ADGroupMember -Credential $creds "GRP GPO McAfee FIX" -Members $comp -ErrorAction SilentlyContinue }

