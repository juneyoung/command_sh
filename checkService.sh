#! /bin/bash
export TARGET_PORT=8080
export INTERVAL_S=5
export CHECK_FLG=0
export COUNT=0
export RETRY=3
echo "Checking a service is running on :: $TARGET_PORT"

while [[ CHECK_FLG -eq 0 ]]; do
	#statements
	sleep $INTERVAL_S
	CHECK_FLG=`netstat -an | grep $TARGET_PORT | grep LISTEN | wc -l`
	echo "Service status $CHECK_FLG"
	if [ $COUNT -gt $RETRY ]; then
		TOTAL_S=`expr $INTERVAL_S \* $RETRY`
		echo "Service did not ready in : $TOTAL_S s"
		exit 1
	fi
	COUNT=$[$COUNT+1]
done

exit 0