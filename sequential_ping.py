'''
Using python 3.9

Windows:
pip3 install ping3
Linux Ubuntu, using VS on Anaconda:
python3 -m pip install ping3
'''
#Press Ctrl+C to end script when you feel like it. It should save to CSV

from tkinter.filedialog import askopenfilename
from ping3 import ping #pinging stuff

import time
import csv

# opening the file with w+ mode truncates the file
with open(r"ServerPingOutput.CSV", "w+") as output_file:
    output = csv.writer(output_file) 
    while (1):
        with open(r"servers.csv") as csv_file:
            csv_reader = csv.reader(csv_file)
            for name in csv_reader:
                print(name[0]) #check server list
                rtt = ping(name[0], unit='ms',timeout=1)
                currenttime = time.time()
                print(rtt)  # Returns delay in seconds.
                print( int(currenttime) )
                output.writerow([name[0], rtt, currenttime])
