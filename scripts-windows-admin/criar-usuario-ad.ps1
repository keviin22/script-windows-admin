#Script para criar um novo usuário no Active Directory

$nome = Read-Host "Digite o primeiro nome do usuário"
$sobrenome = Read-Host "Digite o sobrenome"
$departamento = Read-Host "Digite o departamento"
$senhaTexto = Read-Host "Digite uma senha" -AsSecureString

$nomeCompleto = "$nome $sobrenome"
$usuario = ($nome.Substring(0,1) + $sobrenome).ToLower()

$dominio = "seudominio.local"
$ou = "OU=Users,DC=seudominio,DC=local"

New-ADUser `
    -Name $nomeCompleto `
    -GivenName $nome `
    -Surname $sobrenome `
    -SamAccountName $usuario `
    -UserPrincipalName "$usuario@dominio" `
    -Department $departamento `
    -AccountPassword $senhaTexto `
    -Enabled $true `
    -Path $ou `
    -ChangePasswordAtLogon $true `
Write-Host "Usuário $nomeCompleto criado com sucesso!" -ForegroundColor Green