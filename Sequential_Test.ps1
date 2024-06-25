$Output= @()
$Time= @()
$names = Get-content "servers.txt"

for ($i = 0;  $i -lt 750; $i++){# Make sure loop starts from 0 and goes to number of trials.
	#Write-Host $i #debug, write number of loop on terminal
	#Write-Host (Get-Date).ToString('MM/dd/yyyy hh:mm:ss tt') #time per loop
	foreach ($name in $names){ #loop down the list of servers

		$obj = Test-Connection -Count 1 -Delay 1 -BufferSize 1500 -ComputerName $name -ErrorAction SilentlyContinue

$Time+= (Get-Date -UFormat %s -Millisecond 0)
#Write-Host (Get-Date -UFormat %s -Millisecond 0)

		if($obj){
   			$Output+= ($obj | Select -ExpandProperty "Responsetime")
   			#Write-Host ($obj | Select -ExpandProperty "Responsetime") #debug, write on terminal
		}
  		else{
   			$Output+= "0"
    			#Write-Host "0" #debug, write on terminal
  		}

	}
}
$Output | Out-file "result.csv"
$Time | Out-file "time.csv"
Pause
