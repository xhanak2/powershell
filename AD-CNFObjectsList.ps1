# For all domains

(Get-ADForest).Domains | ForEach-Object {Get-ADObject -LDAPFilter "(|(cn=*\0ACNF:*)(ou=*CNF:*))" -Server $_}

# For one domain

 "grouphc.net"| ForEach-Object {Get-ADObject -LDAPFilter "(|(cn=*\0ACNF:*)(ou=*CNF:*))" -Server $_ -properties *}|Out-GridView

