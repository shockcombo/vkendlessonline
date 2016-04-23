#!/bin/bash
destdir=/var/scriptkiddies/variables.txt
	declare -i DATE
	declare -x STARTTIME
	declare -x ENDTIME

# READ FILE MIST BE FORMATTED LIKE THIS
# DATE=$DATE
# STARTTIME=$STARTTIME
# ENDTIME=$ENDTIME

# Check if our file is exists
if [ -e $destdir ]; then
  echo "File $1 already exists. Going through, everything is fine."
  source /var/scriptkiddies/variables.txt
else
  echo "File $destdir is missing! Stop."
  exit 1
fi

CURRENTDATE=`date '+%d'`
if [[ $CURRENTDATE > $DATE ]]
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
	printf "echo DATE=$DATE\n echo START=$START\n echo END=$END" > "$destdir"

    echo New day has been started!
else
message="Day has been already started. Day: $DATE, current day: $CURRENTDATE"
    echo $message
fi

TIME=`date '+%s'`
if [[ "$TIME" -ge "$START" && "$TIME" -le "$END" ]] ; then
	php -q /var/scriptkiddies/login.php > /dev/null
  	echo "Start time: $STARTTIME, end time $ENDTIME."
fi

if [[ "$TIME" -ge "$END" && "$CURRENTDATE" = "$DATE" ]] ; then

    echo "ST was: $STARTTIME, ET was: $ENDTIME."
    echo "Come back tomorrow"
fi
