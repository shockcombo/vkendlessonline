#!/bin/bash
# VARIABLES.TXT FILE MIST BE FORMATTED LIKE THIS
# DATE=$DATE
# STARTTIME=$STARTTIME
# ENDTIME=$ENDTIME
destdir=/var/scriptkiddies/variables.txt
TIME=`date '+%s'`
CURRENTDATE=`date '+%d'`

# Check if our file is exists
if [ -e $destdir ]; then
  echo "File $1 already exists. Going through, everything is fine."
  #READ OUR VARIABLES FROM FILE
  source /var/scriptkiddies/variables.txt
else
  echo "File $destdir is missing! Stop."
  exit 1
fi

if [ $CURRENTDATE -gt $DATE ]
then
# get random time hour and minute to start logging in
# STARTTIME, ENDTIME will be have format like 10:15 20:44
	MORNINGHOURS=$(( RANDOM % (10 - 7 + 1 ) + 7 ))
	MORNINGMINUTES=${RANDOM:0:2}
	let "MORNINGMINUTES %= 60"
	EVENINGHOURS=$(( RANDOM % (23 - 20 + 1 ) + 20 ))
	EVENINGMINUTES=${RANDOM:0:2}
	let "EVENINGMINUTES %= 60"
	STARTTIME="$MORNINGHOURS:$MORNINGMINUTES"
	ENDTIME="$EVENINGHOURS:$EVENINGMINUTES"
	START=`date --date="$STARTTIME" +%s`
	END=`date --date="$ENDTIME" +%s`
	DATE="$CURRENTDATE"
	# write our variables to file
	printf "DATE=$DATE\nSTART=$START\nEND=$END\nSTARTTIME=$STARTTIME\nENDTIME=$ENDTIME" > "$destdir"

    echo New day has been started!
    echo "Day: $DATE, current: $CURRENTDATE"
    echo "ST: $STARTTIME, ET: $ENDTIME."
    exit 1
else
        echo "Day has been already started. Day: $DATE, current: $CURRENTDATE"
  		echo "ST is: $STARTTIME, ET is: $ENDTIME."
fi

if [ $TIME -gt $END ]
then
	echo Today is over.
	exit 1
	fi

php -q /var/scriptkiddies/login.php > /dev/null
echo Script has been started.
