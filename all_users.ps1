#Skrypt generuje plik csv z listą wszystkich użytkowników

#Atrybut: DistinguishedName

Get-ADUser -Filter * -SearchBase 'OU=po, OU=qwe, DC=qaz, DC=ab' | Where-Object { $_.DistinguishedName -notlike '*OU=Nieprzypisani*' } | Select Name |
Export-Csv "c:\AD_nask_sa.csv" -Encoding UTF8 -NoTypeInformation
