#The script searches for a user by team name and login in Active Directory and returns information about the groups to which he belongs

$team = Read-Host "What is the name of the user team?"
$a = "*$team*"
Get-ADOrganizationalUnit -Filter 'Name -like $a' | Format-Table -wrap Name, DistinguishedName -A
clear
$login = Read-Host "Please enter user login"
Get-ADUser $login | select name
$a = Get-ADPrincipalGroupMembership $login | select name
$a = $a -replace '@{name=', ''
$a = $a -replace '}', ';'
$a = $a -replace 'Domain Users;', ''
$a
