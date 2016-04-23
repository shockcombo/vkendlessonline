# VKEndlessOnline
PHP script + executable .sh to run every 3 minutes to keep online in random interval (7-10 AM for AM and 20-23 for PM, minutes are randomly generated too)
You will be banned for 24/7 hours online. Futhermore, i don't know will you get ban or not, testing this application ATM.

Requirements: PHP (i used 5.6.19), unix-based environment, curl
INSTRUCTION:
1. Unpack archive wherever you want;
2. Define your path into crontab.sh to your variables.txt file;
3. Change your login, password and 8 last number of your mobile number;
4. Open your terminal and enter "crontab -e" to edit your crontab file.
5. Add a line to your crontab line to "*/3 * * * * bash /var/scriptkiddies/crontab.sh"
6. Whooila, it works!

-- if you want to change online hours, change this "MORNINGHOURS=$(( RANDOM % (10 - 7 + 1 ) + 7 ))" where is 7 - start time interval, and 10 is for end. EVENINGHOURS has the same structure.

How it works:
1. If our variable file exists - go through the script, else - error message and stop;
2. If current date bigger than our config variable, then we are going to generate random hour and minutes to start from and time where our script ends FOR NEXT DAY. 
3. Transform it to UNIXTIME;
4. Set Date to current one;
5. Write our variables into variables.txt file;
6. If everything is fine and if wasn't any errors -- it should run. All errors you could see by bashing himself in console.

Wish it could be useful for you.
Good luck and have fun.
