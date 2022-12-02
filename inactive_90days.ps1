#Skrypt generuje do pliku csv listę użytkowników nieaktywnych od 90 dni

#Atrybut: LastLogonTimeStamp

$DaysInactive = 90
$Time = (Get-Date).Adddays( - ($DaysInactive))

$OU = "OU=abc, OU=def, DC=qaz ,DC=qw"
$DaysInactive = 90
$Time = (Get-Date).Adddays( - ($DaysInactive))

Get-ADUser -Filter { LastLogonTimeStamp -lt $Time -and enabled -eq $true } -SearchBase $OU -Properties * |
Select-Object -Property CN, LastLogonDate |
 
Export-Csv "c:\InactiveUsers.csv" -Encoding UTF8 -NoTypeInformation
