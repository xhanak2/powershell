# Get Terminal Services details from AD
$Results = @()
$Allusers = Get-ADUser -SearchBase 'OU=Users,OU=AUS,OU=OC,DC=grouphc,DC=net'-Filter * -properties * | select DistinguishedName,Samaccountname,GivenName,Surname,CanonicalName,city,CN,company,country,department,employeeNumber,homedirectory,Homedrive,homeMDB,I,office,profilepath
 foreach ($user in $Allusers)
    {
    $userSearch = [adsi]("LDAP://" + $user.DistinguishedName)
    $TermPath = $userSearch.psbase.InvokeGet(“terminalservicesprofilepath”)
    $TermHomeDirectoryPath = $userSearch.psbase.InvokeGet(“TerminalServicesHomeDirectory”)
    $TermHomeDriveLetter = $userSearch.psbase.InvokeGet(“TerminalServicesHomeDrive”)
    $prop = @{
            samaccountname = $user.Samaccountname
            firstname = $user.GivenName
            lastname = $user.Surname
            CanonicalName = $user.CanonicalName
            city = $user.city
            CN = $user.CN
            company = $user.company
            country = $user.country
            department = $user.department
            employeeNumber = $user.employeeNumber
            homedirectory = $user.homedirectory
            Homedrive = $user.Homedrive
            homeMDB = $user.homeMDB
            I = $user.I
            office = $user.office
            profilepath = $user.profilepath
            TermPath = $termPath
            TermHomeDirectoryPath = $TermHomeDirectoryPath
            TermHomeDriveLetter = $TermHomeDriveLetter
            }
    $result = New-Object -TypeName PSObject -Property $Prop
    $Results += $result
    }
    $results|Export-Csv -delimiter "*" c:\temp\AUS-term.csv