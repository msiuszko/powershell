#Skrypt generuje listę użytkowników, którym hasło nigdy nie wygasa

#Atrybut: PasswordNeverExpires

Get-ADUser -Filter {Enabled -eq $True -and PasswordNeverExpires -eq $True} -Properties Name, Mail, LastLogon,
Description, Office, Title, distinguishedname | Select Name,Mail, @{Name='LastLogon';Expression={[DateTime]::FromFileTime($_.LastLogon)}}, Description, Office, Title, distinguishedname
