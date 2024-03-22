    # PowerShell function for AD User ID Operations
    # Version 1.06
    # Written by Salman Ahmed
    # Last updated 03:30 PM 15/03/2024
    # This PowerShell function is designed to manage AD User ID


function Get-ADID {
    param (
        [string]$Title = 'Active Directory User ID Operations'
    )

    Clear-Host
    Write-Host "***************************************************************************************************"
    Write-host ""
    Write-host "PowerShell Function for AD User ID Operations"
    Write-host "Version      : 1.06"
    Write-host "Written by   : Salman Ahmed"
    Write-host "Last updated : 03:30 PM 15/03/2024"
    Write-host ""
    Write-host ""	
    Write-host "This PowerShell function is designed to manage AD User ID"
    Write-host ""
    Write-host "***************************************************************************************************"
    Write-Host ""
    Write-Host ""

    $UserID = Read-Host "Please enter the user's AD ID"
    Clear-Host


    Write-Host "--------------------------------------------------------------------------------------------------------"
    Get-ADUser $UserID -Properties * | select Name, Title, SamAccountName, UserPrincipalName, EmailAddress, CanonicalName, `
	PasswordExpired, LockedOut, Enabled, PasswordLastSet, LastLogonDate, LastBadPasswordAttempt, WhenCreated, WhenChanged, `
	AccountExpirationDate
    Write-Host "--------------------------------------------------------------------------------------------------------"


do {
  [int]$userMenuChoice = 0

  while ( $userMenuChoice -lt 1 -or $userMenuChoice -gt 4) {

    Write-Host ""
    write-host "    1: Get ID Status"
    write-host "    2: Unlock the ID"
    write-host "    3: Enable the Account"
    write-host "    4: Exit"
    Write-Host ""
    Write-Host ""
[int]$userMenuChoice = Read-Host "Please choose an option"

 
 switch ($userMenuChoice) {
     
  1 {

    Clear-Host
    Write-Host "--------------------------------------------------------------------------------------------------------"
    Get-ADUser $UserID -Properties * | select Name, Title, SamAccountName, UserPrincipalName, EmailAddress, CanonicalName, `
	PasswordExpired, LockedOut, Enabled, PasswordLastSet, LastLogonDate, LastBadPasswordAttempt, WhenCreated, WhenChanged, `
	AccountExpirationDate
    Write-Host "--------------------------------------------------------------------------------------------------------"


  }

  2 {
	Unlock-ADAccount $UserID

  }

  3 {
	Enable-ADAccount $UserID	

  }


   default {Clear-Host; Write-Host "Quiting from the PowerShell function..."}

    }
  }
} while ( $userMenuChoice -ne 4 )


}

