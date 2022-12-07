#Skrypt generuje plik csv z listą użytkowników, którzy maja ustawioną datę wygasania konta w AD

#Atrybut: AccountExpires

Get-ADUser -Filter "Enabled -eq 'True' -and AccountExpires -ne '0'" -SearchBase "OU=abc, OU=def, DC=qa, DC=wq" -Properties AccountExpirationDate,LastLogonDate |
    Where {$_.AccountExpirationDate -gt 0 } |
   Export-Csv "c:\expiration_date.csv" -Encoding UTF8 -NoTypeInformation
