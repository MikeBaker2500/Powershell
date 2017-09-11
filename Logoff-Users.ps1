#==================================================================================================
# Author: Mike Baker
# Script: Logoff-Users.ps1
# 
# Purpose: Discover all current remote sessions on a server and log off a specified user
#==================================================================================================


#Add all sessions output in var $sessions

 $sessions = query session | ?{ $_ -notmatch '^ SESSIONNAME' } | %{
 $item = "" | Select "Active", "SessionName", "Username", "Id", "State", "Type", "Device"
 $item.Active = $_.Substring(0,1) -match '>'
 $item.SessionName = $_.Substring(1,18).Trim()
 $item.Username = $_.Substring(19,20).Trim()
 $item.Id = $_.Substring(39,9).Trim()
 $item.State = $_.Substring(48,8).Trim()
 $item.Type = $_.Substring(56,12).Trim()
 $item.Device = $_.Substring(68).Trim()
 $item
 } 

#Loop to log out every user
 
 foreach ($session in $sessions)
 {
 If ($session.username -eq "XXXXXXXXX") 
    {logoff $session.Id}

  
 }
