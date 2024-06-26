'''
Using python 3.7

Windows:
pip3 install ping3
'''
from tkinter.filedialog import askopenfilename
from ping3 import ping #pinging stuff

import time
import csv
starttime = time.time()

# opening the file with w+ mode truncates the file
with open(r"C:\Users\aaron\OneDrive - Naval Postgraduate School\NPS Research\Powershell script\ServerPingOutput.CSV", "w+") as output_file:
    output = csv.writer(output_file) 
    while (time.time()<starttime+90000):#run for 25 hours
        with open(r"C:\Users\aaron\OneDrive - Naval Postgraduate School\NPS Research\Powershell script\servers.csv") as csv_file:
            csv_reader = csv.reader(csv_file)
            for name in csv_reader:
                print(name[0]) #check server list
                rtt = ping(name[0], unit='ms',timeout=1)
                currenttime = time.time()
                print(rtt)  # Returns delay in seconds.
                print( int(currenttime) )
                output.writerow([name[0], rtt, currenttime])
