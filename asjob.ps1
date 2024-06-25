$Output= @()
$names = Get-content "servers.txt"

	$obj = Test-Connection -Count 1 -Delay 1 -BufferSize 1500 -ComputerName $Names -ErrorAction SilentlyContinue -AsJob |Receive-Job -Wait
   	$Output += $obj
	Write-Host ($obj | Select -ExpandProperty "Address") 
   	Write-Host ($obj | Select -ExpandProperty "Responsetime") 

$Output | Out-file "result2.csv"
Pause
