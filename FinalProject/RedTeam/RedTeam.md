# Red Team: Summary of Operations

## **Target 1**
  - Planning and Reconnaissance and Vulnerability Identification Phase
  - The exploitation phase
  - Privilege Escalation

## Planning and Reconnaissance and Vulnerability Identification Phase

After running `nmap -sS -sC -sV -Pn 192.168.1.0/24 > nmapNetworkResults.txt ` we can identify all the IP's, and what they're doing on the network.

| HOSTNAME       |     IP        | OPEN PORTS |
|----------------|---------------|------------|
| HOST           | 192.168.1.1   |            |
| KALI (root)    | 192.168.1.90  |            |
| ELK            | 191.68.1.100 | 22, 9200   |
| TARGET1        | 192.168.1.110 |22, 80, 111, 53625, 53854|


Now that we've identified `192.168.1.110` as the target WordPress server, and we can enumerate with a common wordlist provided by the WPSCAN command, using `wpscan --url http://192.168.1.110/wordpress/ `,

[wordpress_results.png]

we found the users `michael` and `steven`, and some associated directories

Port 22 is open, lets see if we can `ssh michael@192.168.1.015` and guess the password.



## The exploitation phase
Know that we can traverse the directories, we can go to common default directory names to look for *the sensitive information* that we are looking for.

*flag1*
found in `/var/wwwa/html/service.html`
![](pictures/RedTeam/FLAG1.png)

Oops! someone left the credentials for the SQL database lying around at `/var/www/html/wordpress/wp-config.php`
![](pictures/RedTeam/wordpress_login.png)

*flag2*
found in `/var/www/`
![](pictures/RedTeam/FLAG2.png)

Both of these flags just take a little bit of time to find and go through, they're located in similar directories that would normally be of interest, While looking also looking for the SQL database

Going into the SQL database we can see that the credentials are `root:R@v3nSecurity` taking a look with `mysql -u root -p wordpress` we can see the following databases, the one of interest seems to be `wordpress`





![](pictures/RedTeam/steven_password_bruteforce.png)

*flag3* found found `wordpress/wp_posts` in the SQL `wordpress` database

![](pictures/RedTeam/FLAG3.png)

To get the password for user `steven`, we go into `wp_users` in the `WordPress` database, and get the hash for steven, the hash `$P$BK3VD9jsxx/loJOqNsURgHiaB23j7W/`, is a WordPress hash that's implemented from the `Portable PHP password hashing framework`

![](pictures/RedTeam/User_hashes.png)


### Privilege Escalation

So, there is an intended way to do a real exploit left for this lab to do privilege escalation, and it will be demonstrated, but it is important to note that the root password was any first root password guess you can do, `toor`, which saved any real attempt for actual thinking.

The "intended" way to escalate privileges is by seeing what we have available to us as far as sudo privileges, which you can do by typing `sudo -l`

![](pictures/RedTeam/sudoprivs.png)

This shows that we can run the python libraries as sudo, which allows us a very easy, even if we can only use one line (since we do not have permissions to make files, such as a python script, we have to). It's rather really easy, just use `sudo python -c 'import pty;pty.spawn("/bin/bash")'`, and there you go! You have full root access to this machine.

![](pictures/RedTeam/PrivEsc.png)

Flag 4 is found in `/root/`

![](pictures/RedTeam/FLAG4.png)

And that's all!
