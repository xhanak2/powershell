# For all domains

(Get-ADForest).Domains | ForEach-Object {Get-ADObject -LDAPFilter "(|(cn=*\0ACNF:*)(ou=*CNF:*))" -Server $_}

# For one domain

 "itc.itcgr.net"| ForEach-Object {Get-ADObject -LDAPFilter "(|(cn=*\0ACNF:*)(ou=*CNF:*))" -Server $_ -properties *}|Out-GridView

