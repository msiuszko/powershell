#Skrypt generuje do pliku csv listę użytkowników, którym konto wygasa w ciągu najbliższych 30 dni

#Atrybut: AccountExpires

$30days = (get-date).AddDays(30)
Get-ADUser -Filter {Enabled -eq $True -and accountexpirationdate -le $30days } -Properties Name, Description, Office, distinguishedname, accountexpirationdate | Select Name, Description, Office, distinguishedname, accountexpirationdate |
Export-Csv "c:\expires_30days.csv" -Encoding UTF8 -NoTypeInformation
