$Users = Import-Csv -Path "C:\Personal.csv"            
foreach ($User in $Users)            
{            
    $Displayname = $User.'Eesnimi' + " " + $User.'Perenimi'            
    $UserFirstname = $User.'Eesnimi'            
    $UserLastname = $User.'Perenimi'            
    $OU =  "OU=" + $User.'Grupp' + ",OU=Kasutajad,DC=student,DC=lan"            
    $SAM = $User.'Eesnimi' + "." + $User.'Perenimi'     
    $UPN = $User.'Eesnimi' + "." + $User.'Perenimi' + "@eestiasi.lan"           
    $Password = "Hello" + $User.'Isikukood'
    $City = $User.'Linn'    
    $Email = $User.'Email'
    $Phone = $User.'Telefon'       
    $Job = $User.'Amet'
    $Address = $User.'Aadress'
    New-ADUser -Name "$Displayname" -DisplayName "$Displayname" -SamAccountName $SAM -StreetAddress $Address -Title "$Job" -UserPrincipalName $UPN -OfficePhone "$Phone" -GivenName "$UserFirstname" -EmailAddress "$Email" -Surname "$UserLastname" -City "$City" -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) -Enabled $true -Path "$OU" -ChangePasswordAtLogon $true -PassThru           
} 