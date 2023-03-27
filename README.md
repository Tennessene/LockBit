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
* Have an anti-virus software seperate from the built-in defender installed.
* Keep all systems, software, and firmware up to date
* Disable unused ports
* Take backups and keep them safe

## [#StopRansomware: LockBit 3.0](https://www.cisa.gov/news-events/cybersecurity-advisories/aa23-075a)

**This project is only for the investigation of the ransomware and how it can be mitigated. It is not to be used for its original purpose of encrypting users' files.**

“#Stopransomware: Lockbit 3.0: CISA.” Cybersecurity and Infrastructure Security Agency CISA, 15 Mar. 2023, https://www.cisa.gov/news-events/cybersecurity-advisories/aa23-075a. 
