$Output= @()
$names = Get-content "servers.txt"

for ($i = 0;  $i -lt 1; $i++){# Make sure loop starts from 0 and goes to number of trials.
	#Write-Host $i #debug, write number of loop on terminal
	#Write-Host (Get-Date).ToString('MM/dd/yyyy hh:mm:ss tt') #time per loop
	
	$names | foreach-Object -Parallel {

		$obj = Test-Connection -Count 1 -Delay 1 -BufferSize 1500 -ComputerName $_ -ErrorAction SilentlyContinue

		if($obj){
   			$Output+= ($obj | Select -ExpandProperty "Latency")
   			Write-Host $_
			Write-Host ($obj | Select -ExpandProperty "Latency")
		}
  		else{
   			$Output+= "0"
    			Write-Host "0"
  		}

	}
}
$Output | Export-Csv -Path .\result3.csv
Pause