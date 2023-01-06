#Funkcja generuje listę użytkowników z datą wygasania konta 
#Atrybut: AccountExpires 

function accountExpiresToString($accountExpires) {
    if (($_.AccountExpires -eq 0) -or
        ($_.AccountExpires -eq [int64]::MaxValue)) {
        "Never expires"
    }
    else {
        [datetime]::fromfiletime($accountExpires)
    }
}
 
$users= Get-ADUser -Filter "Enabled -eq 'True' " -SearchBase "OU=ab, OU=cd, DC=ef, DC=gh" -Properties Name, distinguishedname, AccountExpires | Select-Object @{l="expiration_date";e={ accountExpiresToString($_.AccountExpires)}}, Name
foreach ($user in $users)
{
    if ($user.expiration_date -ne 'Never expires')
    {
       $user
    }
 
}
