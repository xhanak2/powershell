# DNS names for computers in list
$computers = Get-Content 'C:\temp\WINSNAM\wins.txt'
$test = $false

foreach ($computer in $computers)
{
	write-host -NoNewLine "Verifying" $computer " ... "
	try
	{
		$dnscheck = [System.Net.DNS]::GetHostByName($computer)
		$computer + " * " + $true >> C:\temp\WINSNAM\dns.txt
	}
	catch
	{
        $computer + " * " + $false >> C:\temp\WINSNAM\dns.txt
	}
}



