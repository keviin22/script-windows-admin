#Impora o módulo do Active Dicrectory
Import-Module ActiveDirectory

#Lista todos os usuários e exibe nome e login (SamAccountName)
Get=ADUser -Filter * | Select-Object Name, SamAccountName

