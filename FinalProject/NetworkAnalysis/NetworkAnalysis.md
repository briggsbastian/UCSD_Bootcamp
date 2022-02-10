# Network Analysis
#### Questions based off PCAP file that was provided
## Time Thieves

At least two users on the network have been wasting time on YouTube. Usually, IT wouldn't pay much mind to this behavior, but it seems these people have created their own web server on the corporate network. So far, Security knows the following about these time thieves:
* They have set up an Active Directory network.
* They are constantly watching videos on YouTube.
* Their IP addresses are somewhere in the range 10.6.12.0/24, filtered with `ip.addr == 10.6.12.0/24`

You must inspect your traffic capture to answer the following questions:

The domain name of the users' custom site? `http://wpad.frank-n-ted.com//`

The IP address of the Domain Controller (DC) of the AD network is `10.6.12.12`

What is the name of the malware downloaded to the 10.6.12.203 machine?


![](pictures/NetworkAnalysis/Virus_total.png)

![](pictures/NetworkAnalysis/Genetics.png)

#### Notes

YouTube, uses both UDP and TCP to send data transfer, so if I filter for UDP packets, I can narrow down the search significantly to only 5 packets, signaling the suspect IP is `10.6.12.12`

 ![](pictures/NetworkAnalysis/UDP_packets.png)

## Vulnerable Windows Machines

The Security team received reports of an infected Windows host on the network. They know the following:
* Machines in the network live in the range 172.16.4.0/24.
* The network has standard gateway and broadcast addresses.
* The domain mind-hammer.net is associated with the infected computer.
    * Host Name: mind-hammer.net (Dell_19:49:50)
    * IP address: 172.16.4.4
    * MAC address: a4:ba:db:19:49:50



#### The following is information about the infected Windows machine:
  * Host name: LenovoEM_b0:63:a4
  * IP address: 172.16.4.205
  * MAC address: 00:59:07:b0:63:a4
  * User Name: AS-REQ


 **IP addresses used in the actual infection traffic**
  * 172.16.4.205
  * 172.16.4.4


3. As a bonus, retrieve the desktop background of the Windows host.

![](pictures/NetowrkAnalysis/DesktopBackground.png)

## Illegal Downloads

IT was informed that some users are torrenting on the network. The Security team does not forbid the use of torrents for legitimate purposes, such as downloading operating systems. However, they have a strict policy against copyright infringement.

IT shared the following about the torrent activity:
* The machines using torrents live in the range 10.0.0.0/24 and are clients of an AD domain.
* The DC of this domain lives at 10.0.0.2 and is named DogOfTheYear-DC.
* The DC is associated with the domain dogoftheyear.net.


**The following information about the machine with IP address 10.0.0.201**
* MAC address: 00:16:17:18:66:c8
* Windows username: elmer.blanco
* OS version: Windows NT 10.0

BitTorrent File:

![](pictures/NetworkAnalysis/BitTorrent_grab.png)
