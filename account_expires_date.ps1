#Skrypt generuje plik csv z listą użytkowników, którzy w AD mają ustawioną datę wygaśnięcia konta. Plik zawiera tylko wartość SamAccountName
#Atrybut: AccountExpires

Get-ADUser -Filter 'enabled -eq $true' -Searchbase "OU=one, OU=two, DC=xyz, DC=ab" -Properties AccountExpirationDate | Select SAMAccountName |export-csv C:\ExpiryDate.csv -NoTypeInformation
