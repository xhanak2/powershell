# Take a list of computers in plaintext
$serverlist = get-content C:\Temp\WINSNAM\wins.txt
#
foreach ($server in $serverlist) {
    try{
        Get-ADComputer $server -properties name, lastlogondate -ErrorAction SilentlyContinue |select name, lastlogondate | Out-File C:\temp\WINSNAM\AD.txt -Append -NoClobber
         }
    catch{
                  $server + " NOTFOUND" |Out-File C:\temp\WINSNAM\AD.txt -Append

    }
}
