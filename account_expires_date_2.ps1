#Skrypt pobiera plik csv (generuje go skrypt account_expires_date.ps1)  i zmienia datę wygasania konta użytkowników na nigdy niewygasające

#Atrybut: AccountExpires

Import-Csv "C:\ExpiryDate.csv" | ForEach-Object{ $samAccountName = $_."samAccountName" Clear-ADAccountExpiration -Identity $samAccountName }
